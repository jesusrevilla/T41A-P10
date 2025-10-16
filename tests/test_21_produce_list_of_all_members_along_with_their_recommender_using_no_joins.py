import psycopg2
import pytest

# Datos esperados para todos los miembros con sus recomendadores (sin JOINs)
EXPECTED_RESULTS = [
    ("Anna Mackenzie", "Darren Smith"),
    ("Anne Baker", "Ponder Stibbons"),
    ("Burton Tracy", None),
    ("Charles Owen", "Darren Smith"),
    ("Darren Smith", None),
    ("David Farrell", "Jemima Farrell"),
    ("David Jones", None),
    ("Douglas Jones", "David Jones"),
    ("Erica Crumpet", "Tracy Smith"),
    ("Florence Bader", "Ponder Stibbons"),
    ("Gerald Butters", "Darren Smith"),
    ("Henrietta Rumney", "Matthew Genting"),
    ("Henry Worthington-Smyth", "Tracy Smith"),
    ("Hyacinth Tupperware", "Henrietta Rumney"),
    ("Jack Smith", "Darren Smith"),
    ("Janice Joplette", "Darren Smith"),
    ("Jemima Farrell", None),
    ("Joan Coplin", "Timothy Baker"),
    ("John Hunt", "Millicent Purview"),
    ("Matthew Genting", None),
    ("Millicent Purview", "Tracy Smith"),
    ("Nancy Dare", "Janice Joplette"),
    ("Ponder Stibbons", "Burton Tracy"),
    ("Ramnaresh Sarwin", "Florence Bader"),
    ("Tim Boothe", "Ponder Stibbons"),
    ("Timothy Baker", "Jemima Farrell"),
    ("Tracy Smith", None),
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
        with open("21_Produce_a_list_of_all_members,_along_with_their_recommender,_using_no_joins.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Verificar que tenemos el número correcto de resultados
        assert len(results) == len(EXPECTED_RESULTS)
        
        # Verificar que todos los nombres esperados están en los resultados
        result_names = [(row[0], row[1]) for row in results]
        expected_names = [(row[0], row[1]) for row in EXPECTED_RESULTS]
        
        for expected_name in expected_names:
            assert expected_name in result_names, f"Nombre {expected_name} no encontrado en resultados"
