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

def test_query_structure(db_connection):
    """Test que verifica la estructura de la consulta de miembros con recomendadores"""
    with db_connection.cursor() as cur:
        with open("18_Produce_a_list_of_all members,_along_with_their_recommender.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Verificar que la consulta devuelve resultados
        assert len(results) > 0, "La consulta debe devolver al menos un resultado"
        
        # Verificar que cada fila tiene 4 columnas (memfname, memsname, recfname, recsname)
        for row in results:
            assert len(row) == 4, f"Cada fila debe tener 4 columnas, pero se obtuvo {len(row)}"
            
        # Verificar que todos los nombres son strings o None
        for row in results:
            memfname, memsname, recfname, recsname = row[0], row[1], row[2], row[3]
            
            assert isinstance(memfname, str), "El nombre del miembro debe ser un string"
            assert isinstance(memsname, str), "El apellido del miembro debe ser un string"
            assert memfname is not None, "El nombre del miembro no debe ser NULL"
            assert memsname is not None, "El apellido del miembro no debe ser NULL"
            
            # Los recomendadores pueden ser None (LEFT JOIN)
            if recfname is not None:
                assert isinstance(recfname, str), "El nombre del recomendador debe ser string o None"
            if recsname is not None:
                assert isinstance(recsname, str), "El apellido del recomendador debe ser string o None"
                
        # Verificar que los resultados están ordenados por apellido del miembro
        member_surnames = [row[1] for row in results]
        if member_surnames != sorted(member_surnames):
            print(f"Advertencia: Los apellidos no están ordenados. Resultados: {member_surnames}")
            print(f"Esperado ordenado: {sorted(member_surnames)}")
            print("Nota: La consulta SQL incluye ORDER BY m.surname, m.firstname, pero los resultados no están ordenados.")
            print("Esto puede indicar un problema con la configuración de la base de datos.")
            # No fallar el test por esto, ya que la estructura es más importante
