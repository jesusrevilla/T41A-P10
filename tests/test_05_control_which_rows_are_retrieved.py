import psycopg2
import pytest

# Datos esperados para la consulta con WHERE membercost > 0
EXPECTED_RESULTS = [
    (0, "Tennis Court 1", 5, 25, 10000, 200),
    (1, "Tennis Court 2", 5, 25, 8000, 200),
    (4, "Massage Room 1", 35, 80, 4000, 3000),
    (5, "Massage Room 2", 35, 80, 4000, 3000),
    (6, "Squash Court", 3.5, 17.5, 5000, 80),
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
        with open("05_Control_which_rows_are_retrieved.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        assert results == EXPECTED_RESULTS
