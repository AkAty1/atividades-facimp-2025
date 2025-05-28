import tkinter as tk
from tkinter import ttk, messagebox
from db import listar_usuarios, adicionar_usuario, editar_usuario, deletar_usuario

senha_mostrada = False

def atualizar_tabela():
    for item in tree.get_children():
        tree.delete(item)
    usuarios = listar_usuarios()
    for usuario in usuarios:
        
        tree.insert("", "end", values=(usuario[0], usuario[1], usuario[2], "••••••"))

def toggle_senha():
    global senha_mostrada
    selecionado = tree.focus()
    if not selecionado:
        messagebox.showwarning("Aviso", "Selecione um usuário para mostrar a senha.")
        return
    valores = tree.item(selecionado)["values"]
    if senha_mostrada:
        label_senha_real.config(text="Senha: ••••••")
        senha_mostrada = False
    else:

        usuarios = listar_usuarios()
        senha_real = None
        for usuario in usuarios:
            if usuario[0] == valores[0]:
                senha_real = usuario[3]
                break
        label_senha_real.config(text=f"Senha: {senha_real}")
        senha_mostrada = True

def abrir_formulario(titulo, callback, usuario=None):
    form = tk.Toplevel(root)
    form.title(titulo)

    tk.Label(form, text="Nome:").grid(row=0, column=0, padx=5, pady=5)
    entry_nome = tk.Entry(form)
    entry_nome.grid(row=0, column=1, padx=5, pady=5)

    tk.Label(form, text="Email:").grid(row=1, column=0, padx=5, pady=5)
    entry_email = tk.Entry(form)
    entry_email.grid(row=1, column=1, padx=5, pady=5)

    tk.Label(form, text="Senha:").grid(row=2, column=0, padx=5, pady=5)
    entry_senha = tk.Entry(form, show="*")
    entry_senha.grid(row=2, column=1, padx=5, pady=5)

    def alternar_senha():
        if entry_senha.cget("show") == "*":
            entry_senha.config(show="")
            btn_ver_senha.config(text="🙈")
        else:
            entry_senha.config(show="*")
            btn_ver_senha.config(text="👁️")

    btn_ver_senha = tk.Button(form, text="👁️", command=alternar_senha)
    btn_ver_senha.grid(row=2, column=2, padx=2)

    if usuario:
        entry_nome.insert(0, usuario[1])
        entry_email.insert(0, usuario[2])
        entry_senha.insert(0, usuario[3])

    def confirmar():
        nome = entry_nome.get()
        email = entry_email.get()
        senha = entry_senha.get()
        if not nome or not email or not senha:
            messagebox.showerror("Erro", "Todos os campos são obrigatórios.")
            return
        if usuario:
            callback(usuario[0], nome, email, senha)
        else:
            callback(nome, email, senha)
        form.destroy()
        atualizar_tabela()

    tk.Button(form, text="Salvar", command=confirmar).grid(row=3, column=0, columnspan=3, pady=10)

def on_adicionar():
    abrir_formulario("Adicionar Usuário", adicionar_usuario)

def on_editar():
    selecionado = tree.focus()
    if not selecionado:
        messagebox.showwarning("Aviso", "Selecione um usuário para editar.")
        return
    valores = tree.item(selecionado)["values"]
    abrir_formulario("Editar Usuário", editar_usuario, valores)

def on_deletar():
    selecionado = tree.focus()
    if not selecionado:
        messagebox.showwarning("Aviso", "Selecione um usuário para deletar.")
        return
    valores = tree.item(selecionado)["values"]
    confirm = messagebox.askyesno("Confirmar", f"Deseja deletar o usuário {valores[1]}?")
    if confirm:
        deletar_usuario(valores[0])
        atualizar_tabela()

# ----- Janela Principal -----
root = tk.Tk()
root.title("Gerenciador de Usuários")

tree = ttk.Treeview(root, columns=("id", "nome", "email", "senha"), show="headings")
tree.heading("id", text="ID")
tree.heading("nome", text="Nome")
tree.heading("email", text="Email")
tree.heading("senha", text="Senha")
tree.pack(padx=10, pady=10)

frame_botoes = tk.Frame(root)
frame_botoes.pack(pady=10)

tk.Button(frame_botoes, text="Adicionar", command=on_adicionar).grid(row=0, column=0, padx=5)
tk.Button(frame_botoes, text="Editar", command=on_editar).grid(row=0, column=1, padx=5)
tk.Button(frame_botoes, text="Deletar", command=on_deletar).grid(row=0, column=2, padx=5)
tk.Button(frame_botoes, text="Atualizar", command=atualizar_tabela).grid(row=0, column=3, padx=5)
tk.Button(frame_botoes, text="Mostrar/Ocultar Senha", command=toggle_senha).grid(row=0, column=4, padx=5)

label_senha_real = tk.Label(root, text="Senha: ••••••")
label_senha_real.pack(pady=5)

atualizar_tabela()
root.mainloop()
