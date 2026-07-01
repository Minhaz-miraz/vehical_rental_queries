-- creating fixed option for user role
CREATE TYPE user_role_enum AS enum('admin', 'customer');


-- creating fixed option for  vehicle table
CREATE TYPE vehicle_type_enum AS enum('car', 'bike', 'truck');


CREATE TYPE vehicle_availability AS enum('available', 'booked', 'maintenance');
-- creating fixed option for  bookings table

CREATE TYPE bookings_status AS enum('pending', 'confirmed', 'completed', 'cancelled');


-- USER table creation
CREATE TABLE IF NOT EXISTS users (
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL,
  email varchar(100) UNIQUE NOT NULL,
  phone varchar(50) not null unique,
  password varchar(255) NOT NULL,
  role user_role_enum NOT NULL DEFAULT 'customer',
  created_at timestamp DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp DEFAULT CURRENT_TIMESTAMP
);


-- VEHICLE  table creation
CREATE TABLE IF NOT EXISTS vehicles (
  id SERIAL PRIMARY KEY,
  name varchar(50) NOT NULL,
  model int NOT NULL,
  type vehicle_type_enum NOT NULL,
  reg_no varchar(50) UNIQUE NOT NULL,
  price int NOT NULL CHECK (price > 0),
  availability vehicle_availability NOT NULL DEFAULT 'available',
  created_at timestamp DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS bookings (
  id serial PRIMARY KEY,
  user_id int NOT NULL REFERENCES users (id)  ON DELETE CASCADE,
  vehicle_id int NOT NULL REFERENCES vehicles (id)  ON DELETE CASCADE,
  start_date date NOT NULL,
  end_date date NOT NULL,
  status bookings_status DEFAULT 'pending' NOT NULL,
  total_cost int NOT NULL CHECK (total_cost >= 0),
  CONSTRAINT chk_booking_dates CHECK (end_date >= start_date)
);

ALTER TABLE users 
ADD COLUMN phone VARCHAR(255) not null;



-- data insert
-- ============================================
-- 20 Users ডেটা ইনসার্ট (Phone সহ)
-- ============================================
INSERT INTO
  users (
    name,
    email,
    phone,
    password,
    role,
    created_at,
    updated_at
  )
VALUES
  (
    'Md. Abdur Rahman',
    'rahman@gmail.com',
    '01710000001',
    '$2b$10$XQwZ5nL8Kf9HjM2nPqR7tO6sT3uVwXyZ1AbCdEfGhIjKlMnOpQrStU',
    'customer',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Fatema Akhter',
    'fatema@gmail.com',
    '01710000002',
    '$2b$10$YQwZ5nL8Kf9HjM2nPqR7tO6sT3uVwXyZ1AbCdEfGhIjKlMnOpQrStU',
    'customer',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Md. Kamal Hossain',
    'kamal@gmail.com',
    '01710000003',
    '$2b$10$ZQwZ5nL8Kf9HjM2nPqR7tO6sT3uVwXyZ1AbCdEfGhIjKlMnOpQrStU',
    'customer',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Shahinur Begum',
    'shahinur@gmail.com',
    '01710000004',
    '$2b$10$aQwZ5nL8Kf9HjM2nPqR7tO6sT3uVwXyZ1AbCdEfGhIjKlMnOpQrStU',
    'customer',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Md. Jamil Hasan',
    'jamil@gmail.com',
    '01710000005',
    '$2b$10$bQwZ5nL8Kf9HjM2nPqR7tO6sT3uVwXyZ1AbCdEfGhIjKlMnOpQrStU',
    'customer',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Nadia Sultana',
    'nadia@gmail.com',
    '01710000006',
    '$2b$10$cQwZ5nL8Kf9HjM2nPqR7tO6sT3uVwXyZ1AbCdEfGhIjKlMnOpQrStU',
    'customer',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Md. Rajib Ahmed',
    'rajib@gmail.com',
    '01710000007',
    '$2b$10$dQwZ5nL8Kf9HjM2nPqR7tO6sT3uVwXyZ1AbCdEfGhIjKlMnOpQrStU',
    'admin',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Samia Akhter',
    'samia@gmail.com',
    '01710000008',
    '$2b$10$eQwZ5nL8Kf9HjM2nPqR7tO6sT3uVwXyZ1AbCdEfGhIjKlMnOpQrStU',
    'customer',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Md. Faisal Khan',
    'faisal@gmail.com',
    '01710000009',
    '$2b$10$fQwZ5nL8Kf9HjM2nPqR7tO6sT3uVwXyZ1AbCdEfGhIjKlMnOpQrStU',
    'customer',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Taslima Begum',
    'taslima@gmail.com',
    '01710000010',
    '$2b$10$gQwZ5nL8Kf9HjM2nPqR7tO6sT3uVwXyZ1AbCdEfGhIjKlMnOpQrStU',
    'customer',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Md. Nurul Islam',
    'nurul@gmail.com',
    '01710000011',
    '$2b$10$hQwZ5nL8Kf9HjM2nPqR7tO6sT3uVwXyZ1AbCdEfGhIjKlMnOpQrStU',
    'customer',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Sadia Afrin',
    'sadia@gmail.com',
    '01710000012',
    '$2b$10$iQwZ5nL8Kf9HjM2nPqR7tO6sT3uVwXyZ1AbCdEfGhIjKlMnOpQrStU',
    'customer',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Md. Mahbub Alam',
    'mahbub@gmail.com',
    '01710000013',
    '$2b$10$jQwZ5nL8Kf9HjM2nPqR7tO6sT3uVwXyZ1AbCdEfGhIjKlMnOpQrStU',
    'admin',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Rokeya Sultana',
    'rokeya@gmail.com',
    '01710000014',
    '$2b$10$kQwZ5nL8Kf9HjM2nPqR7tO6sT3uVwXyZ1AbCdEfGhIjKlMnOpQrStU',
    'customer',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Md. Shahidul Haque',
    'shahidul@gmail.com',
    '01710000015',
    '$2b$10$lQwZ5nL8Kf9HjM2nPqR7tO6sT3uVwXyZ1AbCdEfGhIjKlMnOpQrStU',
    'customer',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Nusrat Jahan',
    'nusrat@gmail.com',
    '01710000016',
    '$2b$10$mQwZ5nL8Kf9HjM2nPqR7tO6sT3uVwXyZ1AbCdEfGhIjKlMnOpQrStU',
    'customer',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Md. Ariful Islam',
    'ariful@gmail.com',
    '01710000017',
    '$2b$10$nQwZ5nL8Kf9HjM2nPqR7tO6sT3uVwXyZ1AbCdEfGhIjKlMnOpQrStU',
    'customer',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Shamima Akhter',
    'shamima@gmail.com',
    '01710000018',
    '$2b$10$oQwZ5nL8Kf9HjM2nPqR7tO6sT3uVwXyZ1AbCdEfGhIjKlMnOpQrStU',
    'customer',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Md. Monir Hossain',
    'monir@gmail.com',
    '01710000019',
    '$2b$10$pQwZ5nL8Kf9HjM2nPqR7tO6sT3uVwXyZ1AbCdEfGhIjKlMnOpQrStU',
    'admin',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Masuda Begum',
    'masuda@gmail.com',
    '01710000020',
    '$2b$10$qQwZ5nL8Kf9HjM2nPqR7tO6sT3uVwXyZ1AbCdEfGhIjKlMnOpQrStU',
    'customer',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  );

-- ============================================
-- 20 Vehicles ডেটা ইনসার্ট (সব UNIQUE reg_no)
-- ============================================
INSERT INTO
  vehicles (
    name,
    model,
    type,
    reg_no,
    price,
    availability,
    created_at,
    updated_at
  )
VALUES
  (
    'Toyota',
    2020,
    'car',
    'DHA-1001',
    5000,
    'available',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Honda',
    2021,
    'car',
    'DHA-1002',
    6000,
    'available',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Yamaha',
    2022,
    'bike',
    'DHA-1003',
    2000,
    'available',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Suzuki',
    2020,
    'car',
    'DHA-1004',
    4500,
    'booked',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Honda',
    2023,
    'bike',
    'DHA-1005',
    2500,
    'available',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Toyota',
    2021,
    'truck',
    'DHA-1006',
    8000,
    'available',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Nissan',
    2022,
    'car',
    'DHA-1007',
    5500,
    'maintenance',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'BMW',
    2023,
    'car',
    'DHA-1008',
    7000,
    'available',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Suzuki',
    2021,
    'bike',
    'DHA-1009',
    1800,
    'available',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Toyota',
    2020,
    'truck',
    'DHA-1010',
    7500,
    'booked',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Honda',
    2022,
    'car',
    'DHA-1011',
    6200,
    'available',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Yamaha',
    2021,
    'bike',
    'DHA-1012',
    2200,
    'available',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Ford',
    2023,
    'truck',
    'DHA-1013',
    9000,
    'available',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Nissan',
    2020,
    'car',
    'DHA-1014',
    4800,
    'booked',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'BMW',
    2022,
    'car',
    'DHA-1015',
    7500,
    'available',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Suzuki',
    2023,
    'bike',
    'DHA-1016',
    3000,
    'available',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Toyota',
    2022,
    'car',
    'DHA-1017',
    5800,
    'maintenance',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Honda',
    2020,
    'truck',
    'DHA-1018',
    6800,
    'available',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Yamaha',
    2023,
    'bike',
    'DHA-1019',
    2800,
    'available',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    'Mercedes',
    2023,
    'car',
    'DHA-1020',
    8500,
    'available',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  );

INSERT INTO
  bookings (
    user_id,
    vehicle_id,
    start_date,
    end_date,
    status,
    total_cost
  )
VALUES
  (
    1,
    12,
    '2026-07-01',
    '2026-07-05',
    'confirmed',
    25000
  ),
  (
    2,
    14,
    '2026-07-02',
    '2026-07-04',
    'confirmed',
    6000
  ),
  (
    3,
    16,
    '2026-07-03',
    '2026-07-06',
    'pending',
    10000
  ),
  (
    4,
    13,
    '2026-07-04',
    '2026-07-08',
    'confirmed',
    30000
  ),
  (5, 18, '2026-07-05', '2026-07-07', 'cancelled', 0),
  (
    6,
    20,
    '2026-07-06',
    '2026-07-10',
    'confirmed',
    9000
  ),
  (
    7,
    15,
    '2026-07-07',
    '2026-07-09',
    'completed',
    13500
  ),
  (
    8,
    22,
    '2026-07-08',
    '2026-07-12',
    'pending',
    31000
  ),
  (
    9,
    17,
    '2026-07-09',
    '2026-07-14',
    'confirmed',
    48000
  ),
  (
    10,
    24,
    '2026-07-10',
    '2026-07-13',
    'confirmed',
    36000
  ),
  (
    11,
    19,
    '2026-07-11',
    '2026-07-15',
    'pending',
    35000
  ),
  (
    12,
    26,
    '2026-07-12',
    '2026-07-16',
    'confirmed',
    37500
  ),
  (
    13,
    21,
    '2026-07-13',
    '2026-07-17',
    'cancelled',
    0
  ),
  (
    14,
    28,
    '2026-07-14',
    '2026-07-18',
    'pending',
    29000
  ),
  (
    15,
    23,
    '2026-07-15',
    '2026-07-19',
    'confirmed',
    11000
  ),
  (
    16,
    30,
    '2026-07-16',
    '2026-07-20',
    'completed',
    14000
  ),
  (
    17,
    25,
    '2026-07-17',
    '2026-07-21',
    'confirmed',
    24000
  ),
  (
    18,
    27,
    '2026-07-18',
    '2026-07-22',
    'pending',
    15000
  ),
  (
    19,
    29,
    '2026-07-19',
    '2026-07-23',
    'confirmed',
    34000
  ),
  (
    20,
    31,
    '2026-07-20',
    '2026-07-24',
    'pending',
    42500
  );
  