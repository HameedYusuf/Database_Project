# Health Hero - Patient Health Record System

Health Hero is a simple yet powerful Patient Health Record System designed to manage patient data efficiently. It allows users to store and retrieve patient details, track consultation history, manage diagnoses, medications, and treatment plans, and generate insightful reports.

---

## Features

### Backend (Flask)
- **Search Patients:** Find patients by their name.
- **View Patient History:** Display a patient’s consultation history, including diagnoses, medications, and treatment plans.
- **Add New Patient:** Add new patient records to the system.
- **Generate Reports:** Generate gender-wise statistics for patients.

### Frontend (HTML, JavaScript)
- **Interactive Search:** Search patients and display results.
- **Add Patient Form:** A form to input patient details.
- **List All Patients:** Display all patients in a tabular format.
- **View Patient History:** View detailed history for a selected patient.
- **Generate Reports:** Display a report of patients based on gender.

---

## Project Structure

```
HealthHero/
├── app.py                # Flask backend
├── templates/
│   └── index.html         # Frontend HTML
├── static/
│   └── styles.css         # CSS for styling (if added)
├── requirements.txt       # Python dependencies
├── README.md              # Project documentation
```

---

## Requirements

### Backend
- Python 3.x
- Flask
- Flask-CORS
- Flask-MySQLdb

### Database
- MySQL Server

### Frontend
- HTML5
- JavaScript (ES6)

---

## Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/HameedYusuf/HealthHero.git
   cd HealthHero
   ```

2. **Set Up MySQL Database**
   - Create a database named `HealthHeroDB`.
   - Execute the SQL schema provided in the project to set up tables and insert dummy data.

3. **Install Dependencies**
   - Install Python dependencies:
     ```bash
     pip install -r requirements.txt
     ```

4. **Configure Database Connection**
   - Update the `app.py` file with your MySQL credentials:
     ```python
     app.config['MYSQL_HOST'] = 'localhost'
     app.config['MYSQL_USER'] = 'your_username'
     app.config['MYSQL_PASSWORD'] = 'your_password'
     app.config['MYSQL_DB'] = 'HealthHeroDB'
     ```

5. **Run the Backend**
   ```bash
   python app.py
   ```

6. **Open the Frontend**
   - Open the `index.html` file in your browser.

---

## Usage

### Features Overview

#### 1. **Search Patients**
   - Use the search bar to find patients by their first or last name.

#### 2. **Add New Patient**
   - Fill out the form with patient details and click **Add Patient**. The list of patients will update automatically.

#### 3. **View Patient History**
   - Click the **View History** button next to a patient to see their consultation details.

#### 4. **Generate Reports**
   - Click **Generate Gender Report** to view the gender distribution of patients.

---

## API Endpoints

| Endpoint                              | Method | Description                           |
|---------------------------------------|--------|---------------------------------------|
| `/patients/search?query=<name>`       | GET    | Search patients by name              |
| `/patients/<patient_id>/history`      | GET    | Get a patient's consultation history |
| `/patients`                           | POST   | Add a new patient                    |
| `/reports/patients-gender`            | GET    | Get a gender-wise report             |

---

## Dummy Data

- Preloaded with 10 dummy patients and doctors for testing.
- Includes example consultations, diagnoses, medications, and treatment plans.

---

## Future Enhancements

1. Add authentication for secure access.
2. Include advanced reports, like monthly visit trends.
3. Add support for file uploads (e.g., prescriptions, medical reports).
4. Enhance UI/UX with modern frameworks like React or Angular.
