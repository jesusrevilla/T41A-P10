import psycopg2
import pytest

# Datos esperados para miembros que han usado canchas de tenis
EXPECTED_RESULTS = [
    ("Anna Mackenzie", "Tennis Court 1"),
    ("Anna Mackenzie", "Tennis Court 2"),
    ("Anne Baker", "Tennis Court 1"),
    ("Anne Baker", "Tennis Court 2"),
    ("Burton Tracy", "Tennis Court 1"),
    ("Burton Tracy", "Tennis Court 2"),
    ("Charles Owen", "Tennis Court 1"),
    ("Charles Owen", "Tennis Court 2"),
    ("Darren Smith", "Tennis Court 1"),
    ("Darren Smith", "Tennis Court 2"),
    ("David Farrell", "Tennis Court 1"),
    ("David Farrell", "Tennis Court 2"),
    ("David Jones", "Tennis Court 1"),
    ("David Jones", "Tennis Court 2"),
    ("Douglas Jones", "Tennis Court 1"),
    ("Douglas Jones", "Tennis Court 2"),
    ("Erica Crumpet", "Tennis Court 1"),
    ("Erica Crumpet", "Tennis Court 2"),
    ("Florence Bader", "Tennis Court 1"),
    ("Florence Bader", "Tennis Court 2"),
    ("Gerald Butters", "Tennis Court 1"),
    ("Gerald Butters", "Tennis Court 2"),
    ("Henrietta Rumney", "Tennis Court 1"),
    ("Henrietta Rumney", "Tennis Court 2"),
    ("Henry Worthington-Smyth", "Tennis Court 1"),
    ("Henry Worthington-Smyth", "Tennis Court 2"),
    ("Hyacinth Tupperware", "Tennis Court 1"),
    ("Hyacinth Tupperware", "Tennis Court 2"),
    ("Jack Smith", "Tennis Court 1"),
    ("Jack Smith", "Tennis Court 2"),
    ("Janice Joplette", "Tennis Court 1"),
    ("Janice Joplette", "Tennis Court 2"),
    ("Jemima Farrell", "Tennis Court 1"),
    ("Jemima Farrell", "Tennis Court 2"),
    ("Joan Coplin", "Tennis Court 1"),
    ("Joan Coplin", "Tennis Court 2"),
    ("John Hunt", "Tennis Court 1"),
    ("John Hunt", "Tennis Court 2"),
    ("Matthew Genting", "Tennis Court 1"),
    ("Matthew Genting", "Tennis Court 2"),
    ("Millicent Purview", "Tennis Court 1"),
    ("Millicent Purview", "Tennis Court 2"),
    ("Nancy Dare", "Tennis Court 1"),
    ("Nancy Dare", "Tennis Court 2"),
    ("Ponder Stibbons", "Tennis Court 1"),
    ("Ponder Stibbons", "Tennis Court 2"),
    ("Ramnaresh Sarwin", "Tennis Court 1"),
    ("Ramnaresh Sarwin", "Tennis Court 2"),
    ("Tim Boothe", "Tennis Court 1"),
    ("Tim Boothe", "Tennis Court 2"),
    ("Timothy Baker", "Tennis Court 1"),
    ("Timothy Baker", "Tennis Court 2"),
    ("Tracy Smith", "Tennis Court 1"),
    ("Tracy Smith", "Tennis Court 2"),
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
    """Test que verifica la estructura de la consulta de miembros que han usado canchas de tenis"""
    with db_connection.cursor() as cur:
        with open("19_Produce_a_list_of_all_members_who_have_used_a_tennis_court.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Verificar que la consulta devuelve resultados
        assert len(results) > 0, "La consulta debe devolver al menos un resultado"
        
        # Verificar que cada fila tiene 2 columnas (member, facility)
        for row in results:
            assert len(row) == 2, f"Cada fila debe tener 2 columnas, pero se obtuvo {len(row)}"
            
        # Verificar que no hay duplicados (DISTINCT funciona)
        member_facility_pairs = [(row[0], row[1]) for row in results]
        unique_pairs = list(set(member_facility_pairs))
        assert len(member_facility_pairs) == len(unique_pairs), "No debe haber duplicados en los resultados"
        
        # Verificar que todos los nombres son strings
        for row in results:
            member, facility = row[0], row[1]
            assert isinstance(member, str), "El nombre del miembro debe ser un string"
            assert isinstance(facility, str), "El nombre de la instalación debe ser un string"
            assert member is not None, "El nombre del miembro no debe ser NULL"
            assert facility is not None, "El nombre de la instalación no debe ser NULL"
            
        # Verificar que todas las instalaciones son canchas de tenis
        for row in results:
            facility = row[1]
            assert "Tennis Court" in facility, f"Debe ser una cancha de tenis, pero se obtuvo: {facility}"
            
        # Verificar que los resultados están ordenados por miembro y luego por instalación
        member_facility_pairs = [(row[0], row[1]) for row in results]
        sorted_pairs = sorted(member_facility_pairs)
        assert member_facility_pairs == sorted_pairs, "Los resultados deben estar ordenados por miembro y instalación"
