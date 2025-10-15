import psycopg2
import pytest

# Datos esperados para reservas costosas usando subconsulta
EXPECTED_RESULTS = [
    ("GUEST GUEST", "Massage Room 1", 320.0),
    ("GUEST GUEST", "Massage Room 2", 320.0),
    ("Jemima Farrell", "Massage Room 1", 39.6),
    ("Jemima Farrell", "Massage Room 2", 39.6),
    ("Jemima Farrell", "Tennis Court 2", 34.5),
    ("Jemima Farrell", "Tennis Court 1", 34.5),
    ("Timothy Baker", "Massage Room 1", 39.6),
    ("Timothy Baker", "Massage Room 2", 39.6),
    ("Timothy Baker", "Tennis Court 2", 34.5),
    ("Timothy Baker", "Tennis Court 1", 34.5),
    ("Tracy Smith", "Massage Room 1", 39.6),
    ("Tracy Smith", "Massage Room 2", 39.6),
    ("Tracy Smith", "Tennis Court 2", 34.5),
    ("Tracy Smith", "Tennis Court 1", 34.5),
    ("Ponder Stibbons", "Massage Room 1", 39.6),
    ("Ponder Stibbons", "Massage Room 2", 39.6),
    ("Ponder Stibbons", "Tennis Court 2", 34.5),
    ("Ponder Stibbons", "Tennis Court 1", 34.5),
    ("Burton Tracy", "Massage Room 1", 39.6),
    ("Burton Tracy", "Massage Room 2", 39.6),
    ("Burton Tracy", "Tennis Court 2", 34.5),
    ("Burton Tracy", "Tennis Court 1", 34.5),
    ("Nancy Dare", "Massage Room 1", 39.6),
    ("Nancy Dare", "Massage Room 2", 39.6),
    ("Nancy Dare", "Tennis Court 2", 34.5),
    ("Nancy Dare", "Tennis Court 1", 34.5),
    ("Tim Boothe", "Massage Room 1", 39.6),
    ("Tim Boothe", "Massage Room 2", 39.6),
    ("Tim Boothe", "Tennis Court 2", 34.5),
    ("Tim Boothe", "Tennis Court 1", 34.5),
    ("Janice Joplette", "Massage Room 1", 39.6),
    ("Janice Joplette", "Massage Room 2", 39.6),
    ("Janice Joplette", "Tennis Court 2", 34.5),
    ("Janice Joplette", "Tennis Court 1", 34.5),
    ("Gerald Butters", "Massage Room 1", 39.6),
    ("Gerald Butters", "Massage Room 2", 39.6),
    ("Gerald Butters", "Tennis Court 2", 34.5),
    ("Gerald Butters", "Tennis Court 1", 34.5),
    ("Florence Bader", "Massage Room 1", 39.6),
    ("Florence Bader", "Massage Room 2", 39.6),
    ("Florence Bader", "Tennis Court 2", 34.5),
    ("Florence Bader", "Tennis Court 1", 34.5),
    ("Anne Baker", "Massage Room 1", 39.6),
    ("Anne Baker", "Massage Room 2", 39.6),
    ("Anne Baker", "Tennis Court 2", 34.5),
    ("Anne Baker", "Tennis Court 1", 34.5),
    ("Timothy Baker", "Squash Court", 34.5),
    ("Tracy Smith", "Squash Court", 34.5),
    ("Ponder Stibbons", "Squash Court", 34.5),
    ("Burton Tracy", "Squash Court", 34.5),
    ("Nancy Dare", "Squash Court", 34.5),
    ("Tim Boothe", "Squash Court", 34.5),
    ("Janice Joplette", "Squash Court", 34.5),
    ("Gerald Butters", "Squash Court", 34.5),
    ("Florence Bader", "Squash Court", 34.5),
    ("Anne Baker", "Squash Court", 34.5),
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
        with open("22_Produce_a_list_of_costly_bookings,_using_a_subquery.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        assert results == EXPECTED_RESULTS
