CREATE TABLE "Histories"(
    "id" BIGINT NOT NULL,
    "start_date" DATETIME NOT NULL,
    "end_date" DATETIME NOT NULL,
    "legal_entity_id" BIGINT NOT NULL,
    "status_id" BIGINT NOT NULL
);
ALTER TABLE
    "Histories" ADD CONSTRAINT "histories_id_primary" PRIMARY KEY("id");
CREATE TABLE "Vacancies_lists"(
    "id" BIGINT NOT NULL,
    "vacancy_id" BIGINT NOT NULL
);
ALTER TABLE
    "Vacancies_lists" ADD CONSTRAINT "vacancies_lists_id_primary" PRIMARY KEY("id");
CREATE TABLE "Skills"(
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Skills" ADD CONSTRAINT "skills_id_primary" PRIMARY KEY("id");
CREATE TABLE "Recruitment_processes"(
    "id" BIGINT NOT NULL,
    "interview_date" DATETIME NOT NULL,
    "start_date" DATETIME NULL,
    "status_id" BIGINT NOT NULL
);
ALTER TABLE
    "Recruitment_processes" ADD CONSTRAINT "recruitment_processes_id_primary" PRIMARY KEY("id");
CREATE TABLE "Users"(
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "surname" VARCHAR(255) NOT NULL,
    "middle_name" VARCHAR(255) NULL,
    "phone" VARCHAR(255) NOT NULL,
    "education_level" VARCHAR(255) NOT NULL,
    "skill_list_id" BIGINT NOT NULL,
    "desired_salary" DECIMAL(8, 2) NOT NULL,
    "desired_vacancies_list_id" BIGINT NOT NULL,
    "current_vacancy" VARCHAR(255) NOT NULL,
    "legal_entity_id" BIGINT NOT NULL,
    "history_id" BIGINT NOT NULL
);
ALTER TABLE
    "Users" ADD CONSTRAINT "users_id_primary" PRIMARY KEY("id");
CREATE TABLE "Statuses"(
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Statuses" ADD CONSTRAINT "statuses_id_primary" PRIMARY KEY("id");
CREATE TABLE "Companies"(
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "legal_entity_id" BIGINT NOT NULL,
    "vacancy_id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL
);
ALTER TABLE
    "Companies" ADD CONSTRAINT "companies_id_primary" PRIMARY KEY("id");
CREATE TABLE "User_skill_list"(
    "id" BIGINT NOT NULL,
    "skill_id" BIGINT NOT NULL
);
ALTER TABLE
    "User_skill_list" ADD CONSTRAINT "user_skill_list_id_primary" PRIMARY KEY("id");
CREATE TABLE "Skill_lists"(
    "id" BIGINT NOT NULL,
    "skill_id" BIGINT NOT NULL
);
ALTER TABLE
    "Skill_lists" ADD CONSTRAINT "skill_lists_id_primary" PRIMARY KEY("id");
CREATE TABLE "Vacancies"(
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "skills_list_id" BIGINT NOT NULL,
    "start_date" DATETIME NOT NULL,
    "end_date" DATETIME NOT NULL,
    "education_level" VARCHAR(255) NOT NULL,
    "salary" DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    "Vacancies" ADD CONSTRAINT "vacancies_id_primary" PRIMARY KEY("id");
CREATE TABLE "Legal_entities"(
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "adress" VARCHAR(255) NOT NULL,
    "phone" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "recruitment_process_id" BIGINT NOT NULL
);
ALTER TABLE
    "Legal_entities" ADD CONSTRAINT "legal_entities_id_primary" PRIMARY KEY("id");
ALTER TABLE
    "Vacancies_lists" ADD CONSTRAINT "vacancies_lists_vacancy_id_foreign" FOREIGN KEY("vacancy_id") REFERENCES "Vacancies"("id");
ALTER TABLE
    "Users" ADD CONSTRAINT "users_desired_vacancies_list_id_foreign" FOREIGN KEY("desired_vacancies_list_id") REFERENCES "Vacancies_lists"("id");
ALTER TABLE
    "Users" ADD CONSTRAINT "users_legal_entity_id_foreign" FOREIGN KEY("legal_entity_id") REFERENCES "Legal_entities"("id");
ALTER TABLE
    "Skill_lists" ADD CONSTRAINT "skill_lists_skill_id_foreign" FOREIGN KEY("skill_id") REFERENCES "Skills"("id");
ALTER TABLE
    "Recruitment_processes" ADD CONSTRAINT "recruitment_processes_status_id_foreign" FOREIGN KEY("status_id") REFERENCES "Statuses"("id");
ALTER TABLE
    "Vacancies" ADD CONSTRAINT "vacancies_skills_list_id_foreign" FOREIGN KEY("skills_list_id") REFERENCES "Skill_lists"("id");
ALTER TABLE
    "Companies" ADD CONSTRAINT "companies_vacancy_id_foreign" FOREIGN KEY("vacancy_id") REFERENCES "Vacancies"("id");
ALTER TABLE
    "Users" ADD CONSTRAINT "users_history_id_foreign" FOREIGN KEY("history_id") REFERENCES "Histories"("id");
ALTER TABLE
    "Users" ADD CONSTRAINT "users_skill_list_id_foreign" FOREIGN KEY("skill_list_id") REFERENCES "User_skill_list"("id");
ALTER TABLE
    "Companies" ADD CONSTRAINT "companies_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "Users"("id");
ALTER TABLE
    "Legal_entities" ADD CONSTRAINT "legal_entities_recruitment_process_id_foreign" FOREIGN KEY("recruitment_process_id") REFERENCES "Recruitment_processes"("id");
ALTER TABLE
    "User_skill_list" ADD CONSTRAINT "user_skill_list_skill_id_foreign" FOREIGN KEY("skill_id") REFERENCES "Skills"("id");
ALTER TABLE
    "Histories" ADD CONSTRAINT "histories_status_id_foreign" FOREIGN KEY("status_id") REFERENCES "Statuses"("id");
ALTER TABLE
    "Companies" ADD CONSTRAINT "companies_legal_entity_id_foreign" FOREIGN KEY("legal_entity_id") REFERENCES "Legal_entities"("id");
ALTER TABLE
    "Histories" ADD CONSTRAINT "histories_legal_entity_id_foreign" FOREIGN KEY("legal_entity_id") REFERENCES "Legal_entities"("id");