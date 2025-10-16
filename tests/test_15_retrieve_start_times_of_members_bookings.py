import psycopg2
import pytest

# Datos esperados para las reservas de David Farrell
EXPECTED_RESULTS = [
    ("2012-09-18 09:30:00",),
    ("2012-09-18 13:30:00",),
    ("2012-09-18 17:30:00",),
    ("2012-09-19 08:00:00",),
    ("2012-09-19 12:00:00",),
    ("2012-09-19 15:30:00",),
    ("2012-09-20 08:00:00",),
    ("2012-09-20 12:00:00",),
    ("2012-09-20 15:30:00",),
    ("2012-09-21 08:00:00",),
    ("2012-09-21 12:00:00",),
    ("2012-09-21 15:30:00",),
    ("2012-09-22 08:00:00",),
    ("2012-09-22 12:00:00",),
    ("2012-09-22 15:30:00",),
    ("2012-09-23 08:00:00",),
    ("2012-09-23 12:00:00",),
    ("2012-09-23 15:30:00",),
    ("2012-09-24 08:00:00",),
    ("2012-09-24 12:00:00",),
    ("2012-09-24 15:30:00",),
    ("2012-09-25 08:00:00",),
    ("2012-09-25 12:00:00",),
    ("2012-09-25 15:30:00",),
    ("2012-09-26 08:00:00",),
    ("2012-09-26 12:00:00",),
    ("2012-09-26 15:30:00",),
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
        with open("15_Retrieve the_start_times_of_members'_bookings.sql", "r") as f:
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
