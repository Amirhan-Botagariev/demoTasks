-- Создание таблицы
CREATE TABLE IF NOT EXISTS employees(
    EmployeeId INT PRIMARY KEY,
    ChiefId INT,
    Department VARCHAR(50),
    Name VARCHAR(50),
    Salary DECIMAL(10,2),
    FOREIGN KEY (ChiefId) REFERENCES employees(EmployeeId) ON DELETE SET NULL
);

-- Вставка данных
INSERT INTO EMPLOYEES (EmployeeId, ChiefId, Department, Name, Salary) VALUES
    (1, 1, 'Sales', 'Айгерим', 800),
    (4, 4, 'Marketing', 'Сабина', 900),
    (8, 8, 'QA', 'Дидар', 200);

INSERT INTO EMPLOYEES (EmployeeId, ChiefId, Department, Name, Salary) VALUES
    (2, 1, 'Sales', 'Диляра', 700),
    (3, 4, 'Marketing', 'Мариям', 900),
    (5, 4, 'Marketing', 'Мадина', 1000),
    (6, 8, 'QA', 'Торгын', 300),
    (7, 8, 'QA', 'Айжан', 200);

-- Задание 1
SELECT
    emp.EmployeeId,
    ch.EmployeeId,
    emp.Department,
    emp.Name,
    emp.Salary
FROM employees emp
         JOIN employees ch
              ON emp.ChiefId = ch.EmployeeId
WHERE emp.Salary > ch.Salary;




