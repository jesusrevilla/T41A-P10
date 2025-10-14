import psycopg2
import pytest

# Datos esperados (puedes ajustar los valores según lo que esperas que devuelva la consulta)
EXPECTED_RESULTS = [
    (0, "Tennis Court 1", 5, 25, 10000, 200),
    (1, "Tennis Court 2", 5, 25, 8000, 200),
    (2, "Badminton Court", 0, 15.5, 4000, 50),
    (3, "Table Tennis", 0, 5, 320, 10),
    (4, "Massage Room 1", 35, 80, 4000, 3000),
    (5, "Massage Room 2", 35, 80, 4000, 3000),
    (6, "Squash Court", 3.5, 17.5, 5000, 80),
    (7, "Snooker Table", 0, 5, 450, 15),
    (8, "Pool Table", 0, 5, 400, 15),
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
        with open("03_query_data.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        assert results == EXPECTED_RESULTS
``
