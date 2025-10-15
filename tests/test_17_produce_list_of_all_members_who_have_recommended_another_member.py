import psycopg2
import pytest

# Datos esperados para miembros que han recomendado a otros
EXPECTED_RESULTS = [
    ("Florence", "Bader"),
    ("Ponder", "Stibbons"),
    ("Burton", "Tracy"),
    ("Darren", "Smith"),
    ("Charles", "Owen"),
    ("David", "Jones"),
    ("Douglas", "Jones"),
    ("Erica", "Crumpet"),
    ("Henrietta", "Rumney"),
    ("Henry", "Worthington-Smyth"),
    ("Hyacinth", "Tupperware"),
    ("Jack", "Smith"),
    ("Janice", "Joplette"),
    ("Jemima", "Farrell"),
    ("Joan", "Coplin"),
    ("Matthew", "Genting"),
    ("Millicent", "Purview"),
    ("Nancy", "Dare"),
    ("Ramnaresh", "Sarwin"),
    ("Tim", "Boothe"),
    ("Timothy", "Baker"),
    ("Tracy", "Smith"),
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
        with open("17_Produce_a_list_of_all_members_who_have_recommended_another_member.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        assert results == EXPECTED_RESULTS
