import psycopg2
import pytest

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

def test_delete_based_on_subquery(db_connection):
    with db_connection.cursor() as cur:
        # Contar miembros antes de la eliminación
        cur.execute("SELECT COUNT(*) FROM cd.members")
        members_before = cur.fetchone()[0]
        
        # Contar miembros que tienen bookings
        cur.execute("""
            SELECT COUNT(DISTINCT m.memid) 
            FROM cd.members m
            INNER JOIN cd.bookings b ON b.memid = m.memid
        """)
        members_with_bookings = cur.fetchone()[0]
        
        # Ejecutar el script de eliminación basado en subconsulta
        with open("31_Delete_based_on_a_subquery.sql", "r") as f:
            query = f.read()
        cur.execute(query)
        
        # Verificar que solo quedaron los miembros que tienen bookings
        cur.execute("SELECT COUNT(*) FROM cd.members")
        members_after = cur.fetchone()[0]
        
        # Los miembros restantes deberían ser solo los que tienen bookings
        assert members_after == members_with_bookings
        
        # Verificar que todos los miembros restantes tienen al menos un booking
        cur.execute("""
            SELECT COUNT(*) 
            FROM cd.members m
            WHERE NOT EXISTS (
                SELECT 1 FROM cd.bookings b WHERE b.memid = m.memid
            )
        """)
        members_without_bookings = cur.fetchone()[0]
        assert members_without_bookings == 0
