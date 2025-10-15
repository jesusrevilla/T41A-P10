import psycopg2
import pytest

# Datos esperados para la consulta con condiciones múltiples
EXPECTED_RESULTS = [
    (0, "Tennis Court 1", 5, 200),
    (1, "Tennis Court 2", 5, 200),
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
        with open("06_Control_which_rows_are_retrieved_-_part_2.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        assert results == EXPECTED_RESULTS
