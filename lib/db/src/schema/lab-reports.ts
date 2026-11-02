import { pgTable, serial, text, integer, timestamp, date } from "drizzle-orm/pg-core";
import { createInsertSchema } from "drizzle-zod";
import { z } from "zod/v4";

export const labReportsTable = pgTable("lab_reports", {
  id: serial("id").primaryKey(),
  patientId: integer("patient_id").notNull(),
  testName: text("test_name").notNull(),
  result: text("result"),
  status: text("status").notNull().default("pending"),
  reportDate: date("report_date", { mode: "string" }).notNull(),
  createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
});

export const insertLabReportSchema = createInsertSchema(labReportsTable).omit({ id: true, createdAt: true });
export type InsertLabReport = z.infer<typeof insertLabReportSchema>;
export type LabReport = typeof labReportsTable.$inferSelect;
