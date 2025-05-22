from flask import Flask, render_template, request, redirect, url_for
from datetime import datetime, timedelta
import psycopg2

app = Flask(__name__)

def conectar():
    return psycopg2.connect(
        dbname="atividade",
        user="postgres",
        password="rubens123",
        host="localhost",
        port="5432"
    )

def deletar_usuario(id_usuario):
    conn = conectar()
    cur = conn.cursor()

    tempo_expiracao = datetime.now() + timedelta(minutes=5)

    cur.execute("""
        INSERT INTO usuariodeletado (id_usuario, nome, email, senha, expira_em)
        SELECT id_usuario, nome, email, senha, %s
        FROM Usuario
        WHERE id_usuario = %s;
    """, (tempo_expiracao, id_usuario))

    cur.execute("DELETE FROM Usuario WHERE id_usuario = %s;", (id_usuario,))
    conn.commit()
    cur.close()
    conn.close()

@app.route('/')
def index():
    conn = conectar()
    cur = conn.cursor()
    cur.execute("SELECT * FROM Usuario ORDER BY id_usuario ASC;")
    usuarios = cur.fetchall()
    cur.close()
    conn.close()
    return render_template("index.html", usuarios=usuarios)

@app.route('/adicionar', methods=['GET', 'POST'])
def adicionar():
    if request.method == 'POST':
        nome = request.form['nome']
        email = request.form['email']
        senha = request.form['senha']
        conn = conectar()
        cur = conn.cursor()
        cur.execute("INSERT INTO Usuario (nome, email, senha) VALUES (%s, %s, %s);", (nome, email, senha))
        conn.commit()
        cur.close()
        conn.close()
        return redirect(url_for('index'))
    return render_template('adicionar.html')

@app.route('/editar/<int:id_usuario>', methods=['GET', 'POST'])
def editar(id_usuario):
    conn = conectar()
    cur = conn.cursor()
    if request.method == 'POST':
        nome = request.form['nome']
        email = request.form['email']
        senha = request.form['senha']
        cur.execute("UPDATE Usuario SET nome=%s, email=%s, senha=%s WHERE id_usuario=%s;", (nome, email, senha, id_usuario))
        conn.commit()
        cur.close()
        conn.close()
        return redirect(url_for('index'))
    else:
        cur.execute("SELECT * FROM Usuario WHERE id_usuario = %s;", (id_usuario,))
        usuario = cur.fetchone()
        cur.close()
        conn.close()
        return render_template('editar.html', usuario=usuario)

@app.route('/deletar/<int:id_usuario>')
def deletar(id_usuario):
    deletar_usuario(id_usuario)
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)
