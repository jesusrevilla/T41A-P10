import psycopg2
import pytest

# Datos esperados para la consulta con LIKE '%Tennis%'
EXPECTED_RESULTS = [
    (0, "Tennis Court 1", 5, 25, 10000, 200),
    (1, "Tennis Court 2", 5, 25, 8000, 200),
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
    """Test que verifica la estructura de la consulta de búsqueda de strings"""
    with db_connection.cursor() as cur:
        with open("07_Basic_string_searches.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Verificar que la consulta devuelve resultados
        assert len(results) > 0, "La consulta debe devolver al menos un resultado"
        
        # Verificar que cada fila tiene 6 columnas (todas las columnas de facilities)
        for row in results:
            assert len(row) == 6, f"Cada fila debe tener 6 columnas, pero se obtuvo {len(row)}"
            
        # Verificar que todos los nombres contienen "Tennis"
        for row in results:
            name = row[1]  # La segunda columna es 'name'
            assert "Tennis" in name, f"El nombre debe contener 'Tennis', pero se obtuvo: {name}"
            
        # Verificar que los tipos de datos son correctos
        for row in results:
            facid, name, membercost, guestcost, initialoutlay, monthlymaintenance = row
            
            assert isinstance(facid, int), "facid debe ser un entero"
            assert isinstance(name, str), "name debe ser un string"
            assert isinstance(membercost, (int, float)) or hasattr(membercost, 'as_tuple'), "membercost debe ser numérico"
            assert isinstance(guestcost, (int, float)) or hasattr(guestcost, 'as_tuple'), "guestcost debe ser numérico"
            assert isinstance(initialoutlay, (int, float)) or hasattr(initialoutlay, 'as_tuple'), "initialoutlay debe ser numérico"
            assert isinstance(monthlymaintenance, (int, float)) or hasattr(monthlymaintenance, 'as_tuple'), "monthlymaintenance debe ser numérico"
