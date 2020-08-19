-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/2yQIUx
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "deptid" int   NOT NULL,
    "dept_no" int   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "deptid"
     )
);

CREATE TABLE "titles" (
    "titleid" int   NOT NULL,
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "titleid"
     )
);

CREATE TABLE "employees" (
    "empid" int   NOT NULL,
    "titleid" int   NOT NULL,
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "birth_date" int   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" int   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "empid"
     )
);

CREATE TABLE "dept_emp" (
    "empid" int   NOT NULL,
    "deptid" int   NOT NULL,
    "emp_no" int   NOT NULL,
    "dept_no" varchar   NOT NULL
);

CREATE TABLE "dept_manager" (
    "deptid" int   NOT NULL,
    "empid" int   NOT NULL,
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "salaries" (
    "empid" int   NOT NULL,
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_titleid" FOREIGN KEY("titleid")
REFERENCES "titles" ("titleid");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_empid" FOREIGN KEY("empid")
REFERENCES "employees" ("empid");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_deptid" FOREIGN KEY("deptid")
REFERENCES "departments" ("deptid");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_deptid" FOREIGN KEY("deptid")
REFERENCES "departments" ("deptid");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_empid" FOREIGN KEY("empid")
REFERENCES "employees" ("empid");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_empid" FOREIGN KEY("empid")
REFERENCES "employees" ("empid");

