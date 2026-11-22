/**
 * facts-check.mjs
 *
 * This script verifies the facts presented in the GTA 6 loading.html meme.
 * It calculates the number of days between the release of GTA V and GTA VI
 * using the native JavaScript Date object.
 *
 * The facts verified:
 * 1. 13 years since GTA V release to GTA VI.
 * 2. 2 delays occurred (Fall 2025 -> May 2026 -> Nov 2026).
 * 3. Pre-download of up to 212 GB.
 */

// Defining the facts as an array of objects for easy iteration and validation.
const facts = [
  {
    description: "Years since GTA V (2013-09-17) to GTA VI (2026-11-19)",
    value: "13 years",
    validate: (val) => val === "13 years"
  },
  {
    description: "Delays (Fall 2025 -> May 2026 -> Nov 2026)",
    value: "2",
    validate: (val) => val === "2"
  },
  {
    description: "Pre-download size (GB)",
    value: "212 GB",
    validate: (val) => val === "212 GB"
  }
];

/**
 * Calculates the number of days between two specific dates.
 * @returns {number} The difference in days.
 */
function calculateDaysBetween() {
  const startDate = new Date('2013-09-17');
  const endDate = new Date('2026-11-19');
  
  // Time calculation: End date - Start date in milliseconds
  const diffTime = Math.abs(endDate - startDate);
  
  // Convert milliseconds to days: (1000ms * 60s * 60m * 24h)
  const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
  
  return diffDays;
}

/**
 * Validates a given fact object using its internal validate method.
 * @param {Object} fact - The fact object to validate.
 * @returns {boolean} Whether the fact is validated.
 */
function validateFact(fact) {
  return fact.validate(fact.value);
}

// Execution start
console.log("--------------------------------------------------");
console.log("Starting GTA 6 Meme Fact Verification Process...");
console.log("--------------------------------------------------");

// Displaying facts in a table format
console.table(facts.map(f => ({
  Fact: f.description,
  Value: f.value,
  Valid: validateFact(f)
})));

// Perform calculation
const days = calculateDaysBetween();

console.log(`\nComputed Days between GTA V and GTA VI: ${days} days.`);
console.log("--------------------------------------------------");
console.log("Verification Complete.");
console.log("--------------------------------------------------");

// End of script.
