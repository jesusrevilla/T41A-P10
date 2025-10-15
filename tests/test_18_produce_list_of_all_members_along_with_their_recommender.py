import psycopg2
import pytest

# Datos esperados para todos los miembros con sus recomendadores
EXPECTED_RESULTS = [
    ("Anna", "Mackenzie", "Darren", "Smith"),
    ("Anne", "Baker", "Ponder", "Stibbons"),
    ("Burton", "Tracy", None, None),
    ("Charles", "Owen", "Darren", "Smith"),
    ("Darren", "Smith", None, None),
    ("David", "Farrell", "Jemima", "Farrell"),
    ("David", "Jones", None, None),
    ("Douglas", "Jones", "David", "Jones"),
    ("Erica", "Crumpet", "Tracy", "Smith"),
    ("Florence", "Bader", "Ponder", "Stibbons"),
    ("Gerald", "Butters", "Darren", "Smith"),
    ("Henrietta", "Rumney", "Matthew", "Genting"),
    ("Henry", "Worthington-Smyth", "Tracy", "Smith"),
    ("Hyacinth", "Tupperware", "Henrietta", "Rumney"),
    ("Jack", "Smith", "Darren", "Smith"),
    ("Janice", "Joplette", "Darren", "Smith"),
    ("Jemima", "Farrell", None, None),
    ("Joan", "Coplin", "Timothy", "Baker"),
    ("John", "Hunt", "Millicent", "Purview"),
    ("Matthew", "Genting", None, None),
    ("Millicent", "Purview", "Tracy", "Smith"),
    ("Nancy", "Dare", "Janice", "Joplette"),
    ("Ponder", "Stibbons", "Burton", "Tracy"),
    ("Ramnaresh", "Sarwin", "Florence", "Bader"),
    ("Tim", "Boothe", "Ponder", "Stibbons"),
    ("Timothy", "Baker", "Jemima", "Farrell"),
    ("Tracy", "Smith", None, None),
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
        with open("18_Produce_a_list_of_all members,_along_with_their_recommender.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        assert results == EXPECTED_RESULTS
