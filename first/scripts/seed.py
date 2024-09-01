import os
import psycopg
from faker import Faker


fake = Faker()
Faker.seed(15735546)

db_port = os.getenv('POSTGRES_PORT')
db_name = os.getenv('POSTGRES_DB')
db_user = os.getenv('POSTGRES_USER')
db_password = os.getenv('POSTGRES_PASSWORD')
connection_string = f"host=db port={db_port} user={db_user} password={db_password} dbname={db_name}"

with psycopg.connect(connection_string) as connection:
    with connection.cursor() as cursor:
        
        with cursor.copy("COPY users (fullname, email) FROM STDIN") as copy:
            for _ in range(10_000):
                copy.write_row((fake.name(), fake.unique.email()))

        with cursor.copy("COPY tasks (title, description, status_id, user_id) FROM STDIN") as copy:
            for _ in range(100_000):
                copy.write_row((fake.sentence(), fake.text(), fake.random_int(1, 3), fake.random_int(1, 10_000)))

print("Database seeded successfully!")