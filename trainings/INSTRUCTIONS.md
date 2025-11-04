# Slidev Presentation Creation Instructions

  Create Slidev presentation slides following these requirements:

  Follow sli.dev examples slide to understand the usage

## Input Structure

- Source content from markdown outline files `OUTLINE.md`
- Each outline contains session structure with timing, topics, and real-world examples

## Design Principles

  1. **Visual-First Approach**
     - Use icons over text whenever possible
     - Heavy use of MDI icons (Material Design Icons)
     - Icon format: `<mdi-icon-name />` (self-closing tags)
     - No icons in Mermaid diagrams

  2. **Slide Structure**
     - Every slide must have a `transition:` property (slide-left, fade-out, slide-up, etc.)
     - Use `v-click` for progressive content reveals
     - Apply appropriate layouts: cover, center, two-cols, image-right, end

  3. **Content Style**
     - Concise bullet points (not paragraphs)
     - Use Mermaid diagrams for workflow visualizations
     - Color-coded sections (bg-blue-500/20, bg-green-500/20, etc.)
     - Grid layouts for organized information display
     - Code blocks for technical examples

  4. **Presentation Flow**
     - Cover slide with title
     - Break slides with pause icon and timing
     - Lab introduction slides
     - Step-by-step implementation slides
     - Practice/challenge slides
     - Q&A slide each hour

## Icon Usage Guidelines

- **Navigation**: `<mdi-map />`, `<mdi-arrow-right />`
- **Actions**: `<mdi-plus />`, `<mdi-pencil />`, `<mdi-delete />`
- **Status**: `<mdi-check />`, `<mdi-alert />`, `<mdi-close-circle />`
- **Time**: `<mdi-alarm />`, `<mdi-timer-outline />`
- **People**: `<mdi-account-group />`, `<mdi-hand-wave />`
- **Tech**: `<mdi-cog />`, `<mdi-laptop />`, `<mdi-tools />`
- **Data**: `<mdi-chart-bar />`, `<mdi-database />`
- **Numbers**: `<mdi-numeric-1-circle />` through `<mdi-numeric-4-circle />`

## File Organization

- Main file: `slidev/slides.md` (imports pages)
- Hour pages: `slidev/pages/hour1.md`, `slidev/pages/hour2.md`, etc.
- Use `src: ./pages/hourX.md` to import sections

## Example Slide Pattern

  ```markdown
  ---
  transition: slide-left
  layout: center
  ---

  # Slide Title <mdi-relevant-icon />

  <div v-click class="text-xl mt-8">
  Description text
  </div>

  <div v-click class="mt-12 grid grid-cols-3 gap-8">
    <div class="p-4 border border-main rounded">
      <div class="text-4xl mb-2"><mdi-icon /></div>
      <div class="font-bold">Title</div>
      <div class="opacity-80">Description</div>
    </div>
    <!-- Repeat for other columns -->
  </div>

  Key Requirements

  - Stay true to outline content without adding extra information
  - Keep slides simple and concise
  - Use icons/visuals instead of lengthy text
  - Ensure all transitions and animations are specified
  - Maintain consistent visual hierarchy
  - Create Mermaid diagrams for workflows
  - Include real-world examples from the outline
  - No Key Takeways or additional slides summaries as time constraint
