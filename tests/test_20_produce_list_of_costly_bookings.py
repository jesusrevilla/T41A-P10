import psycopg2
import pytest

# Datos esperados para reservas costosas del 14 de septiembre
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

def test_query_structure(db_connection):
    """Test que verifica la estructura de la consulta de reservas costosas"""
    with db_connection.cursor() as cur:
        with open("20_Produce_a_list_of_costly_bookings.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        results = cur.fetchall()
        
        # Verificar que la consulta devuelve resultados
        assert len(results) > 0, "La consulta debe devolver al menos un resultado"
        
        # Verificar que cada fila tiene 3 columnas (member, facility, cost)
        for row in results:
            assert len(row) == 3, f"Cada fila debe tener 3 columnas, pero se obtuvo {len(row)}"
            
        # Verificar que los costos son numéricos y mayores a 30
        for row in results:
            member, facility, cost = row[0], row[1], row[2]
            
            assert member is not None, "El nombre del miembro no debe ser NULL"
            assert facility is not None, "El nombre de la instalación no debe ser NULL"
            assert cost is not None, "El costo no debe ser NULL"
            
            # Convertir costo a float si es Decimal
            if hasattr(cost, 'as_tuple'):  # Si es Decimal
                cost_value = float(cost)
            else:
                cost_value = float(cost)
                
            assert cost_value > 30, f"El costo debe ser mayor a 30, pero se obtuvo: {cost_value}"
            
        # Verificar que los resultados están ordenados por costo descendente
        costs = []
        for row in results:
            cost = row[2]
            if hasattr(cost, 'as_tuple'):  # Si es Decimal
                costs.append(float(cost))
            else:
                costs.append(float(cost))
                
        assert costs == sorted(costs, reverse=True), "Los costos deben estar ordenados de mayor a menor"
