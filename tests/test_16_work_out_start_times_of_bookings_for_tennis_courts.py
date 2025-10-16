import psycopg2
import pytest

# Datos esperados para las reservas de canchas de tenis el 21 de septiembre
EXPECTED_RESULTS = [
    ("2012-09-21 08:00:00", "Tennis Court 1"),
    ("2012-09-21 08:00:00", "Tennis Court 2"),
    ("2012-09-21 09:30:00", "Tennis Court 1"),
    ("2012-09-21 10:00:00", "Tennis Court 2"),
    ("2012-09-21 11:30:00", "Tennis Court 2"),
    ("2012-09-21 12:00:00", "Tennis Court 1"),
    ("2012-09-21 13:30:00", "Tennis Court 1"),
    ("2012-09-21 14:00:00", "Tennis Court 2"),
    ("2012-09-21 15:30:00", "Tennis Court 1"),
    ("2012-09-21 16:00:00", "Tennis Court 2"),
    ("2012-09-21 17:30:00", "Tennis Court 1"),
    ("2012-09-21 18:00:00", "Tennis Court 2"),
]

@pytest.fixture(scope="module")
def db_connection():
    conn = psycopg2.connect(
        dbname="exercises",
        user="postgres",
        password="postgres",
        host="localhost"
    )
    yield conn
    conn.close()

def test_query_data(db_connection):
    with db_connection.cursor() as cur:
        with open("16_Work_out_the_start_times_of_bookings_for_tennis_courts.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Convertir fechas datetime a string para comparación
        converted_results = []
        for row in results:
            converted_row = list(row)
            if hasattr(converted_row[0], 'strftime'):  # Si es datetime
                converted_row[0] = converted_row[0].strftime('%Y-%m-%d %H:%M:%S')
            converted_results.append(tuple(converted_row))
        
        assert converted_results == EXPECTED_RESULTS
