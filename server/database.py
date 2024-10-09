from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

DATABASE_URL = 'postgresql://postgres:Dileep%402896@localhost:5432/spotifyclone'

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit = False, autoflush = False, bind = engine)

def get_db():
      db = SessionLocal()
      try:
            yield db
      finally:
            db.close()