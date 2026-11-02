# RevoFlux Healthcare Clinic & Hospital Management ERP

[![React](https://img.shields.io/badge/React-19-61DAFB?style=flat-square&logo=react)](https://react.dev/)
[![Node.js](https://img.shields.io/badge/Node.js-20-339933?style=flat-square&logo=node.js)](https://nodejs.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.x-blue?style=flat-square&logo=typescript)](https://www.typescriptlang.org/)
[![Tailwind CSS](https://img.shields.io/badge/TailwindCSS-v4-38B2AC?style=flat-square&logo=tailwind-css)](https://tailwindcss.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](LICENSE)

A complete, production-grade Hospital Information System (HIS), clinic practice management, and electronic medical records (EMR) platform engineered by [RevoFlux](https://revoflux.app). Designed for polyclinics, specialized medical centers, diagnostic labs, and hospital departments.

---

## ⚡ Core Operational Modules

- **Patient Registration & Medical Records (EMR)**: Longitudinal patient history, allergies, vitals tracking, and digital consultation notes.
- **Doctor Directory & Clinical Schedules**: Shift assignments, appointment calendars, and token queues.
- **Diagnostic Laboratory & Pathology**: Test requisition orders, sample barcoding, lab technician review, and automated PDF report issuance.
- **In-House Pharmacy & Formulary**: Prescription fulfillment, batch/lot expiration alerts, and stock dispensing ledgers.
- **Billing, Invoicing & Insurance**: Outpatient/Inpatient billing folios, itemized tariff schedules, and payment reconciliation.
- **Role-Based Workstations**: Custom permission boundaries for Doctors, Nurses, Lab Technicians, Pharmacists, and Cashiers.

---

## 🏗️ Architecture & Workspaces

```text
revoflux-health-clinic-portal/
├── lib/
│   ├── api-client-react/   # React Query type-safe API hooks
│   ├── api-spec/           # OpenAPI 3.0 specification & endpoints
│   ├── api-zod/            # Zod validation schemas
│   └── db/                 # Database connection & query builders
├── scripts/                # Database seeding & migration runners
├── prisma/                 # Relational database models
├── docker-compose.yml      # Multi-container service orchestration
├── seed.sql                # Initial schema & demo clinical datasets
├── package.json
└── README.md
```

---

## 🚀 Quick Start

### 1. Install Dependencies
```bash
npm install
```

### 2. Run Database Seeding
```bash
npm run seed
```

### 3. Launch Development Server
```bash
npm run dev
```
Access the clinical command dashboard at [http://localhost:3000](http://localhost:3000).

---

## 📄 License
Released under the [MIT License](LICENSE). Maintained by [RevoFlux](https://revoflux.app).

**Enterprise Deployments & Custom Work:** [revoflux.ai@gmail.com](mailto:revoflux.ai@gmail.com) | [Founder LinkedIn](https://www.linkedin.com/in/muhammad-dawood-dev)
