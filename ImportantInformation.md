# mPlacementTracker Project 
## Databases:
            STUDENT
        CREATE TABLE STUDENTS(
          name TEXT,
          rollNumber INTEGER PRIMARY KEY,
          tenth INTEGER,
          twelfth INTEGER,
          cgpa INTEGER,
          course TEXT,
          email TEXT,
          password TEXT)

            COMPANY
        CREATE TABLE COMPANY(
          name TEXT PRIMARY KEY,
          details TEXT,
          tenth REAL,
          twelfth REAL,
          arrival TEXT,
          backlogs INTEGER,
          ctc REAL,
          graduation REAL,
          link TEXT)
## Sample Data Already In The Database (For QuickLogin)
    Sample Company
      arrival: "12-04-2020",
      backlogs: 0,
      ctc: 95,
      details: "The Dream Company",
      graduation: 10,
      link: "TXT",
      name: "A Company That Never Came",
      tenth: 0,
      twelfth: 0
    Sample Student
      name: 'A Student That Never Existed',
      cgpa: '10',
      course: 'B.Tech: CS-SD',
      email: 'a@mmumullana.org',
      password: '123',
      rollNumber: 17000,
      tenth: 100,
      twelfth: 100
## Teacher Credentials: 
                        ID: drrg@mmumullana.org
                        Password: 123
## Admin Credentials:
                        ID: admin@mmumullana.org
                        Password:admin123
