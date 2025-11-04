# Session 1 Outline

## Introduction to N8N and Workflow Automation (4 hours)

### **Topic 1: Foundations & First Workflow (60 min)**

#### Welcome & Setup (20 min)

- Introduction and session objectives
- What is N8N? (5 min explanation)
  - Workflow automation basics
  - When to use automation in schools
- Account creation and interface tour (15 min)
  - Canvas, Nodes panel, Executions
  - Quick demo: A working workflow

**Break (5 min)**

#### Hands-on Lab 1: Your First Manual Workflow (30 min)

- Create manual trigger workflow
- Add Set node (create simple data)
- Add IF node (basic logic)
- Test and view results
- **Real example**: Parent email complaint classifier - Automatically categorize incoming parent emails by keywords (urgent/bullying/academic/facilities) and route to appropriate department heads

#### Q&A (5 min)

### **Topic 2: Google Workspace Integration (60 min)**

#### Google Authentication (25 min)

- Overview Google Services API Integration with N8N
- Connect your Google Workspace Account to N8N
- N8N Credentials setup walkthrough

**Break (5 min)**

#### Hands-on Lab 2: Read & Write with Google Sheets (25 min)

- Connect to a prepared Google Sheet
- Fetch and display data
- Filter data with IF node
- **Real example**: Student absence monitoring - Check attendance sheet daily and flag students with 3+ consecutive absences for counselor follow-up

#### Q&A (5 min)

### **Topic 3: AI Agent Integration (60 min)**

#### What Are AI Agents? (5 min)

- AI agents as "smart assistants" in workflows
- No coding required - just conversations
- When to use AI vs traditional nodes
- **School examples**: Auto-summarize parent emails, draft responses, extract key information

**Break (5 min)**

#### Hands-on Lab 4: Your First AI Agent Workflow (30 min)

**Project: Smart Email Responder**

- Manual trigger (paste parent email text)
- AI Agent node (configure with simple prompt)
  - Prompt: "Summarize this parent email in 2-3 bullet points. Identify: main concern, urgency level (low/medium/high), suggested department to handle"
- Set node (structure the AI output)
- Gmail node (send summary to appropriate staff)
- **Why this is powerful**: AI reads context, you don't write complex rules
- Test with different email scenario

#### Q&A (10 min)

### **Topic 4: Complete Workflow (60 min)**

#### Hands-on Lab 5: Build Complete AI Workflow (30 min)

**Project: Intelligent Parent-Teacher Conference Scheduler**

- Manual trigger (paste parent's casual email request)
- AI Agent node #1 (extract booking details)
  - Prompt: "Extract: parent name, student name, grade, preferred dates/times, reason for meeting. If information is missing, list what's needed."
- IF node (check if all info present)
  - **Path A**: Complete info → proceed to booking
  - **Path B**: Missing info → AI drafts reply requesting details
- Google Sheets node (log booking)
- AI Agent node #2 (draft confirmation email)
  - Prompt: "Write a friendly confirmation email including: date, time, teacher name, location (Room 305), and what to bring"
- Gmail node (send confirmation)
- Test with complete vs incomplete requests

**Break (5 min)**

#### AI Agent Best Practices (15 min)

- Writing effective prompts (be specific, give examples)
- When AI is better than IF nodes (unstructured data, summarization, drafting)
- When NOT to use AI (simple calculations, exact matching)
- Cost considerations (tokens/usage)

#### Q&A (10 min)
