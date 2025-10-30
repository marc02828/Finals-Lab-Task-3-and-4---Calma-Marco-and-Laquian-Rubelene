CREATE DATABASE task3;
USE task3;

CREATE TABLE employees (
  employee_id INT AUTO_INCREMENT PRIMARY KEY,
  employee_name VARCHAR(255) NOT NULL,
  manager_id INT NULL,
  CONSTRAINT fk_employees_manager
    FOREIGN KEY (manager_id)
    REFERENCES employees(employee_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE departments (
  department_id INT AUTO_INCREMENT PRIMARY KEY,
  department_name VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE employee_departments (
  employee_id INT NOT NULL,
  department_id INT NOT NULL,
  PRIMARY KEY (employee_id, department_id),
  CONSTRAINT fk_empdept_employee
    FOREIGN KEY (employee_id)
    REFERENCES employees(employee_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_empdept_department
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;


CREATE TABLE employee_projects (
  employee_id INT NOT NULL,
  project_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (employee_id, project_name),
  CONSTRAINT fk_empproj_employee
    FOREIGN KEY (employee_id)
    REFERENCES employees(employee_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;


CREATE TABLE managers (
  manager_id INT AUTO_INCREMENT PRIMARY KEY,
  employee_id INT NOT NULL,
  CONSTRAINT fk_managers_employee
    FOREIGN KEY (employee_id)
    REFERENCES employees(employee_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;
