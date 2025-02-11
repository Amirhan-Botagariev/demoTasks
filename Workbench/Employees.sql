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
    emp.EmployeeId AS EmployeeID,
    emp.Name AS EmployeeName,
    emp.Department,
    emp.Salary AS EmployeeSalary,
    ch.Name AS ChiefName,
    ch.Salary AS ChiefSalary
FROM employees emp
         JOIN employees ch
              ON emp.ChiefId = ch.EmployeeId
WHERE emp.Salary > ch.Salary;


-- Задание 2
SELECT e.Department, COUNT(*) AS num_of_employees
FROM employees e
GROUP BY e.Department
HAVING COUNT(*) <= 3;

-- Задание 3

/*
По поводу формы нормализации данной таблицы можно сказать следующее:
1. Таблица уже точно соответствует 1НФ, так как все его атрибуты являются простыми
и нету повторений строк в таблице как здесь
Фирма      Модели
BMW        M5, X5M, M1
Nissan     GT-R
2. Таблица тоже будет соответствовать 2НФ, так как она уже находится в 1НФ
и у каждого неключевого столбца нету зависимости от части составного первичного ключа
потому что в принципе у таблица нету составного первичного ключа (Только один первичный ключ есть EmployeeId)
поэтому понятие "частичная зависимость" вообще не возникает
3. Таблица скорее не соответствует 3НФ, потому что возникает транзитивная зависимость,
поскольку Department зависит не только напрямую от EmployeeId, но и косвенно зависит от ChiefId

Однако можно допустить что по бизнес правилам сотрудник может состоять в любом отделе, независимо от начальника,
тогда таблица с уверенностью может соответствовать 3НФ
 */




