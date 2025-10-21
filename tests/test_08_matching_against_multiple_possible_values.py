import psycopg2
import pytest

# Datos esperados para la consulta con IN (1, 5)
EXPECTED_RESULTS = [
    (1, "Tennis Court 2", 5, 25, 8000, 200),
    (5, "Massage Room 2", 35, 80, 4000, 3000),
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
        with open("08_Matching_against_multiple_possible_values.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        assert results == EXPECTED_RESULTS
