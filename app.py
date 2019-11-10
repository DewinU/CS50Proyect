from flask import Flask, escape, request, render_template, flash, redirect
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import create_engine, text
app = Flask(__name__)
app.secret_key = '123456'
app.config['SECRET_KEY'] = '123456'
app.config['SQLALCHEMY_DATABASE_URI']='postgresql://postgres:123456@localhost:5432/libros'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)
engine = create_engine('postgresql://postgres:123456@localhost:5432/libros')
connection = engine.connect()

def usd(value):
    return f"C${value:,.2f}"

app.jinja_env.filters["usd"] = usd

@app.route('/')
def principal():
    return render_template("inicio.html")

@app.route('/inicio')
def inicio():
    return render_template("inicio.html")

@app.route('/buscar', methods=["GET", "POST"])
def buscar():
    if request.method == "GET":
        return render_template("buscar.html")
    else:
        metodo = request.form.get("busqueda")
        if metodo == "titulo":
            titulo = request.form.get("titulo") + "%"
            libros = connection.execute(text("SELECT * FROM books WHERE titulo LIKE :busqueda"),
            {"busqueda": titulo})
            flash("Libros encontrados!")
            return render_template("portitulo.html", libros = libros)
            

        elif metodo == "autor":
            autor = request.form.get("autor") + "%"
            libros = connection.execute(text("SELECT * FROM books WHERE autor LIKE :busqueda"),
            {"busqueda": autor})
            flash("Libros encontrados!")
            return render_template("porautor.html", libros = libros)

        else:
            return render_template("buscar.html")


@app.route('/agregar', methods=["GET", "POST"])
def agregar():
    if request.method == "GET":
        return render_template("agregar.html")
    else:
        titulo = request.form.get("titulo")
        autor = request.form.get("autor")
        tipo = request.form.get("tipo")
        calidad = request.form.get("calidad")
        anho = request.form.get("anho")
        precio = request.form.get("precio")
        editorial = request.form.get("editorial")

        connection.execute(text("INSERT INTO books (calidad, tipo, titulo, autor, anho, precio, editorial) VALUES (:calidad, :tipo, :titulo, :autor, :anho, :precio, :editorial)"),
        {"calidad": calidad, "tipo": tipo, "titulo": titulo, "autor": autor, "anho": anho, "precio": precio, "editorial": editorial})

        flash("Libro agregado!")
        return redirect("/")


@app.route('/editar/<int:id_reg>', methods=["GET"])
def editar(id_reg):
    stock = connection.execute(text("SELECT titulo, autor, tipo, anho, calidad, precio, editorial FROM books WHERE idlib=:id_reg"),
    {"id_reg": id_reg}).fetchone()
    return render_template("editar.html", id_reg = id_reg, stock = stock)


@app.route('/editar', methods=["GET","POST"])
def editado():
    id_reg = request.form.get("editar")
    titulo = request.form.get("titulo")
    autor = request.form.get("autor")
    tipo = request.form.get("tipo")
    calidad = request.form.get("calidad")
    anho = request.form.get("anho")
    precio = request.form.get("precio")
    editorial = request.form.get("editorial")
    connection.execute(text("UPDATE books SET titulo=:titulo, autor=:autor, tipo=:tipo, calidad=:calidad, anho=:anho, precio=:precio, editorial=:editorial WHERE idlib=:id_reg"),
    {"id_reg": id_reg, "titulo": titulo, "autor": autor, "tipo": tipo, "calidad": calidad, "anho": anho, "precio": precio, "editorial": editorial})
    flash("Libro editado!")
    return redirect('/')

@app.route('/eliminar/<int:id_reg>', methods=["GET"])
def eliminar(id_reg):
        return render_template("eliminar.html", id_reg = id_reg)

@app.route('/eliminar', methods=["GET", "POST"])
def eliminado():
        id_reg = request.form.get("eliminar")
        connection.execute(text("DELETE FROM books WHERE idlib=:id_reg"),
        {"id_reg": id_reg})
        flash("Libro eliminado!")
        return redirect('/')
        
if __name__ =="__main__":
    app.run(debug=True, port=6969)



