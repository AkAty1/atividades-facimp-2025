import psycopg2
from datetime import datetime, timedelta

def conectar():
    return psycopg2.connect(
        dbname="atividade",
        user="postgres",
        password="rubens123",
        host="localhost",
        port="5432"
    )

def listar_usuarios():
    conn = conectar()
    cur = conn.cursor()
    cur.execute("SELECT * FROM Usuario ORDER BY id_usuario ASC, nome ASC;")
    resultados = cur.fetchall()
    cur.close()
    conn.close()
    return resultados

def adicionar_usuario(nome, email, senha):
    conn = conectar()
    cur = conn.cursor()
    cur.execute(
        "INSERT INTO Usuario (nome, email, senha) VALUES (%s, %s, %s);",
        (nome, email, senha)
    )
    conn.commit()
    cur.close()
    conn.close()

def editar_usuario(id_usuario, nome, email, senha):
    conn = conectar()
    cur = conn.cursor()
    cur.execute(
        "UPDATE Usuario SET nome=%s, email=%s, senha=%s WHERE id_usuario=%s;",
        (nome, email, senha, id_usuario)
    )
    conn.commit()
    cur.close()
    conn.close()
from datetime import datetime, timedelta

def deletar_usuario(id_usuario):
    conn = conectar()
    cur = conn.cursor()

    cur.execute("SELECT * FROM Usuario WHERE id_usuario = %s", (id_usuario,))
    usuario = cur.fetchone()

    if usuario:
        expira_em = datetime.now() + timedelta(minutes=5)
        cur.execute("""
            INSERT INTO usuariodeletado (id_usuario, nome, email, senha, expira_em)
            VALUES (%s, %s, %s, %s, %s)
        """, (usuario[0], usuario[1], usuario[2], usuario[3], expira_em))

        cur.execute("DELETE FROM Usuario WHERE id_usuario = %s", (id_usuario,))
        conn.commit()

    cur.close()
    conn.close()

def limpar_expirados():
    conn = conectar()
    cur = conn.cursor()
    cur.execute("DELETE FROM usuariodeletado WHERE expira_em <= NOW();")
    conn.commit()
    cur.close()
    conn.close()




