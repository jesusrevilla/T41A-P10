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

def test_query_structure(db_connection):
    """Test que verifica la estructura de la consulta de miembros que han recomendado"""
    with db_connection.cursor() as cur:
        with open("17_Produce_a_list_of_all_members_who_have_recommended_another_member.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Verificar que la consulta devuelve resultados
        assert len(results) > 0, "La consulta debe devolver al menos un resultado"
        
        # Verificar que cada fila tiene 2 columnas (firstname, surname)
        for row in results:
            assert len(row) == 2, f"Cada fila debe tener 2 columnas, pero se obtuvo {len(row)}"
            
        # Verificar que no hay duplicados (DISTINCT funciona)
        member_names = [(row[0], row[1]) for row in results]
        unique_member_names = list(set(member_names))
        assert len(member_names) == len(unique_member_names), "No debe haber duplicados en los resultados"
        
        # Verificar que todos los nombres son strings
        for row in results:
            firstname, surname = row[0], row[1]
            assert isinstance(firstname, str), "El nombre debe ser un string"
            assert isinstance(surname, str), "El apellido debe ser un string"
            assert firstname is not None, "El nombre no debe ser NULL"
            assert surname is not None, "El apellido no debe ser NULL"
            
        # Verificar que los resultados están ordenados (ORDER BY funciona)
        surnames = [row[1] for row in results]
        assert surnames == sorted(surnames), "Los apellidos deben estar ordenados alfabéticamente"
