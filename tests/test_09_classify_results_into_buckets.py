import psycopg2
import pytest

# Datos esperados para la consulta con CASE WHEN
EXPECTED_RESULTS = [
    ("Tennis Court 1", "expensive"),
    ("Tennis Court 2", "expensive"),
    ("Badminton Court", "cheap"),
    ("Table Tennis", "cheap"),
    ("Massage Room 1", "expensive"),
    ("Massage Room 2", "expensive"),
    ("Squash Court", "cheap"),
    ("Snooker Table", "cheap"),
    ("Pool Table", "cheap"),
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
        with open("09_Classify_results_into_buckets.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        assert results == EXPECTED_RESULTS
