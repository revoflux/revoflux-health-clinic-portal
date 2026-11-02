# RevoFlux Full-Stack Healthcare Clinic & Patient Portal

[![Next.js 15](https://img.shields.io/badge/Next.js-15-black?style=flat-square&logo=next.js)](https://nextjs.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-336791?style=flat-square&logo=postgresql)](https://www.postgresql.org/)
[![Prisma ORM](https://img.shields.io/badge/Prisma-6.x-2D3748?style=flat-square&logo=prisma)](https://www.prisma.io/)
[![Tailwind CSS](https://img.shields.io/badge/TailwindCSS-v4-38B2AC?style=flat-square&logo=tailwind-css)](https://tailwindcss.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](LICENSE)

A production-grade, HIPAA-aligned healthcare practice management, electronic health records (EHR), and patient telehealth portal engineered by [RevoFlux](https://revoflux.app) for medical clinics, dental practices, physiotherapy studios, and telehealth providers.

---

## ⚡ Core Capabilities

- **Patient Self-Service Booking**: Real-time calendar availability with doctor scheduling constraints.
- **Practitioner Consultation EHR**: Secure clinical notes, diagnosis history, and digital prescriptions.
- **Telehealth Video Integration**: WebRTC room generation for virtual doctor-patient consultations.
- **Role-Based Access Control**: Strict segregation between Doctors, Patients, Nurses, and Receptionists.

---

## 🏗️ Architecture

```text
revoflux-health-clinic-portal/
├── prisma/
│   └── schema.prisma         # Relational clinical patient & practitioner schema
├── src/
│   └── app/
│       └── api/
│           └── appointments/ # REST scheduling endpoints
├── docker-compose.yml        # PostgreSQL & Next.js service orchestration
├── package.json
└── README.md
```

---

## 🚀 Quick Start

```bash
docker-compose up -d db
npm install
npx prisma generate
npm run dev
```
Open [http://localhost:3001](http://localhost:3001) to explore the portal.

---

## 📄 License
Released under the [MIT License](LICENSE). Built and maintained by [RevoFlux](https://revoflux.app).

**Healthcare Software Customization:** [revoflux.ai@gmail.com](mailto:revoflux.ai@gmail.com) | [Founder LinkedIn](https://www.linkedin.com/in/muhammad-dawood-dev)
