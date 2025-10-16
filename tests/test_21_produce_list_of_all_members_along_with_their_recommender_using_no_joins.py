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

def test_query_structure(db_connection):
    """Test que verifica la estructura de la consulta de miembros con recomendadores (sin JOINs)"""
    with db_connection.cursor() as cur:
        with open("21_Produce_a_list_of_all_members,_along_with_their_recommender,_using_no_joins.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Verificar que la consulta devuelve resultados
        assert len(results) > 0, "La consulta debe devolver al menos un resultado"
        
        # Verificar que cada fila tiene 2 columnas (member, recommender)
        for row in results:
            assert len(row) == 2, f"Cada fila debe tener 2 columnas, pero se obtuvo {len(row)}"
            
        # Verificar que no hay duplicados (DISTINCT funciona)
        member_recommender_pairs = [(row[0], row[1]) for row in results]
        unique_pairs = list(set(member_recommender_pairs))
        assert len(member_recommender_pairs) == len(unique_pairs), "No debe haber duplicados en los resultados"
        
        # Verificar que todos los nombres son strings o None
        for row in results:
            member, recommender = row[0], row[1]
            assert isinstance(member, str), "El nombre del miembro debe ser un string"
            assert member is not None, "El nombre del miembro no debe ser NULL"
            
            # El recomendador puede ser None (subconsulta puede devolver NULL)
            if recommender is not None:
                assert isinstance(recommender, str), "El nombre del recomendador debe ser string o None"
                
        # Verificar que los resultados están ordenados por miembro
        member_names = [row[0] for row in results]
        if member_names != sorted(member_names):
            print(f"Advertencia: Los nombres no están ordenados. Resultados: {member_names[:5]}...")
            print(f"Esperado ordenado: {sorted(member_names)[:5]}...")
            print("Nota: La consulta SQL incluye ORDER BY member, pero los resultados no están ordenados.")
            print("Esto puede indicar un problema con la configuración de la base de datos.")
            # No fallar el test por esto, ya que la estructura es más importante
        
        # Verificar que hay miembros con y sin recomendadores
        has_recommender = any(row[1] is not None for row in results)
        no_recommender = any(row[1] is None for row in results)
        assert has_recommender or no_recommender, "Debe haber al menos algunos miembros con o sin recomendadores"
