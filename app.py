from flask import Flask, request, jsonify
from flask_mysqldb import MySQL
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# MySQL configurations
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'your_password'
app.config['MYSQL_DB'] = 'HealthHeroDB'

mysql = MySQL(app)

# Endpoint: Search Patients
@app.route('/patients/search', methods=['GET'])
def search_patients():
    query = request.args.get('query', '')
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT PatientID, FirstName, LastName FROM Patients WHERE FirstName LIKE %s OR LastName LIKE %s", 
                   (f"%{query}%", f"%{query}%"))
    results = cursor.fetchall()
    cursor.close()
    return jsonify(results)

# Endpoint: Get Patient History
@app.route('/patients/<int:patient_id>/history', methods=['GET'])
def patient_history(patient_id):
    cursor = mysql.connection.cursor()
    cursor.execute("""
        SELECT c.ConsultationDate, d.DiagnosisDescription, m.MedicationName, t.TreatmentDescription
        FROM Consultations c
        LEFT JOIN Diagnoses d ON c.ConsultationID = d.ConsultationID
        LEFT JOIN Medications m ON c.ConsultationID = m.ConsultationID
        LEFT JOIN TreatmentPlans t ON c.ConsultationID = t.ConsultationID
        WHERE c.PatientID = %s
    """, (patient_id,))
    results = cursor.fetchall()
    cursor.close()
    return jsonify(results)

# Endpoint: Add New Patient
@app.route('/patients', methods=['POST'])
def add_patient():
    data = request.json
    cursor = mysql.connection.cursor()
    cursor.execute("""
        INSERT INTO Patients (FirstName, LastName, DateOfBirth, Gender, ContactNumber, Email, Address)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
    """, (data['FirstName'], data['LastName'], data['DateOfBirth'], 
          data['Gender'], data['ContactNumber'], data['Email'], data['Address']))
    mysql.connection.commit()
    cursor.close()
    return jsonify({'message': 'Patient added successfully'})

# Endpoint: Generate Reports
@app.route('/reports/patients-gender', methods=['GET'])
def patients_gender_report():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT Gender, COUNT(*) AS Total FROM Patients GROUP BY Gender")
    results = cursor.fetchall()
    cursor.close()
    return jsonify(results)

if __name__ == '__main__':
    app.run(debug=True)
