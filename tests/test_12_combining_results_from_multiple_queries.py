import psycopg2
import pytest

# Datos esperados para la consulta con UNION
EXPECTED_RESULTS = [
    ("Badminton Court",),
    ("Bader",),
    ("Baker",),
    ("Boothe",),
    ("Butters",),
    ("Coplin",),
    ("Crumpet",),
    ("Dare",),
    ("Farrell",),
    ("Genting",),
    ("Hunt",),
    ("Jones",),
    ("Joplette",),
    ("Mackenzie",),
    ("Owen",),
    ("Pinker",),
    ("Purview",),
    ("Rumney",),
    ("Sarwin",),
    ("Smith",),
    ("Snooker Table",),
    ("Squash Court",),
    ("Stibbons",),
    ("Table Tennis",),
    ("Tennis Court 1",),
    ("Tennis Court 2",),
    ("Tracy",),
    ("Tupperware",),
    ("Worthington-Smyth",),
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
    """Test que verifica la estructura de la consulta con UNION"""
    with db_connection.cursor() as cur:
        with open("12_Combining_results_from_multiple_queries.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Verificar que la consulta devuelve resultados
        assert len(results) > 0, "La consulta debe devolver al menos un resultado"
        
        # Verificar que cada fila tiene 1 columna
        for row in results:
            assert len(row) == 1, f"Cada fila debe tener 1 columna, pero se obtuvo {len(row)}"
            
        # Verificar que no hay duplicados (UNION elimina duplicados)
        names = [row[0] for row in results]
        unique_names = list(set(names))
        assert len(names) == len(unique_names), "No debe haber duplicados en los resultados del UNION"
        
        # Verificar que todos los nombres son strings
        for name in names:
            assert isinstance(name, str), "Cada nombre debe ser un string"
            
        # Verificar que hay tanto nombres de instalaciones como de miembros
        # Esto indica que el UNION está funcionando correctamente
        facility_names = [name for name in names if any(keyword in name.lower() for keyword in ['court', 'table', 'room'])]
        member_names = [name for name in names if not any(keyword in name.lower() for keyword in ['court', 'table', 'room'])]
        
        assert len(facility_names) > 0, "Debe haber nombres de instalaciones en los resultados"
        assert len(member_names) > 0, "Debe haber nombres de miembros en los resultados"
