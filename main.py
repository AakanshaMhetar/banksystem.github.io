from flask import  Flask, render_template , request , redirect, url_for
import mysql.connector
from flask_mysqldb import MySQL
app=Flask(__name__)
app.secret_key = "flash message"

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_DB'] = 'crudapp'

mysql = MySQL(app)


@app.route('/')
def student():
    return render_template('bank.html')
@app.route('/transaction')
def transaction():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM customer")
    data = cur.fetchall()
    cur.close()
    return render_template('transfer.html', customer=data)

@app.route('/main')
def main():
    return render_template('bank.html')

@app.route('/insert', methods=['POST'])
def insert():
    if request.method == "POST":
        name = request.form['name']
        email = request.form['email']
        amount = request.form['amount']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO customer(name , email , amount)VALUES(%s,%s,%s)",(name,email,amount))
        mysql.connection.commit()
        cur.close()
        return redirect(url_for('transaction'))

@app.route('/moneyTransfer' , methods =['POST','GET'])
def moneyTransfer():
    if request.method == "POST":
        name = request.form['name']
        email = request.form['email']
        amount = request.form['amount']
        id = request.form['id']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO history(sid,rname,money)VALUES(%s,%s,%s)", (id, name, amount))
        rows = cur.execute("SELECT amount FROM customer WHERE name=%s AND email=%s", (name, email))
        if rows > 0:
            data = cur.fetchall()
            namo = int(data[0][0]) + int(amount)
            cur.execute("UPDATE customer SET amount=%s WHERE name=%s", (namo, name))
            rows1 = cur.execute("SELECT amount FROM customer WHERE id=%s", (id))
            if rows1 > 0:
                data = cur.fetchall()
                namo1 = int(data[0][0]) - int(amount)
                cur.execute("UPDATE customer SET amount=%s WHERE id=%s", (namo1,id))
                rows2 = cur.execute('SELECT * FROM customer')
                if rows2 > 0:
                    details = cur.fetchall()
                cur.connection.commit()
                cur.close()
                return render_template('transfer.html', msg='Money transferred successfully..!', customer=details,color='success')
            else:
                rows2 = cur.execute('SELECT * FROM customer')
                if rows2 > 0:
                    details = cur.fetchall()
                return render_template('transfer.html', msg='Money transfer failed..!', customer=details, color='danger')



@app.route('/hist')
def hist():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM history")
    data = cur.fetchall()
    cur.close()
    return render_template('history.html', history=data)


app.run(debug=True)