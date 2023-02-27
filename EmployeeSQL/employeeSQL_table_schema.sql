-- Table: public.departments

-- DROP TABLE IF EXISTS public.departments;

CREATE TABLE IF NOT EXISTS public.departments
(
    dept_no character varying(30) COLLATE pg_catalog."default" NOT NULL,
    dept_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (dept_no)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.departments
    OWNER to postgres;

-- Table: public.dept_emp

-- DROP TABLE IF EXISTS public.dept_emp;

CREATE TABLE IF NOT EXISTS public.dept_emp
(
    emp_no integer NOT NULL,
    dept_no character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (emp_no, dept_no),
    CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY (dept_no)
        REFERENCES public.departments (dept_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dept_emp
    OWNER to postgres;

-- Table: public.dept_mangaer

-- DROP TABLE IF EXISTS public.dept_mangaer;

CREATE TABLE IF NOT EXISTS public.dept_mangaer
(
    dept_no character varying(30) COLLATE pg_catalog."default" NOT NULL,
    emp_no integer NOT NULL,
    CONSTRAINT pk_dept_mangaer PRIMARY KEY (emp_no),
    CONSTRAINT fk_dept_mangaer_dept_no FOREIGN KEY (dept_no)
        REFERENCES public.departments (dept_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_dept_mangaer_emp_no FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dept_mangaer
    OWNER to postgres;

-- Table: public.employees

-- DROP TABLE IF EXISTS public.employees;

CREATE TABLE IF NOT EXISTS public.employees
(
    emp_no integer NOT NULL,
    emp_title_id character varying(30) COLLATE pg_catalog."default" NOT NULL,
    birth_date date NOT NULL,
    first_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    sex character varying(1) COLLATE pg_catalog."default" NOT NULL,
    hire_date date NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (emp_no),
    CONSTRAINT fk_employees_emp_title_id FOREIGN KEY (emp_title_id)
        REFERENCES public.titles (title_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.employees
    OWNER to postgres;

-- Table: public.salaries

-- DROP TABLE IF EXISTS public.salaries;

CREATE TABLE IF NOT EXISTS public.salaries
(
    emp_no integer NOT NULL,
    salary integer NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (emp_no),
    CONSTRAINT fk_salaries_emp_no FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.salaries
    OWNER to postgres;

-- Table: public.titles

-- DROP TABLE IF EXISTS public.titles;

CREATE TABLE IF NOT EXISTS public.titles
(
    title_id character varying(30) COLLATE pg_catalog."default" NOT NULL,
    title character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (title_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.titles
    OWNER to postgres;