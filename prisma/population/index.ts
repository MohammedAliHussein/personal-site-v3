import { PrismaClient } from '@prisma/client';
import { projects } from './projects.js';

const prisma = new PrismaClient()

async function main() {
  projects.forEach(async (project: any) => {
    await addProject(project);
    addTechnologies(project);
  });
}

async function addProject(project: any) {
  await prisma.projects.create({
    data: {
      title: project.title,
      project_description: project.project_description,
      in_progress: project.in_progress,
      link: project.link,
      is_hidden: project.is_hidden,
      github: project.github,
    }
  });
}

function addTechnologies(project: any) {
  project.technologies.forEach(async (technology: any) => {
    await prisma.projectTechnology.create({
      data: {
        title: project.title,
        technology_name: technology
      }
    });
  })
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  });
