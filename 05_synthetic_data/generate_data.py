import csv
import random
from datetime import date, timedelta
from pathlib import Path


# ============================================================
# US Healthcare Insurance Analytics Dashboard
# Synthetic Data Generator
# Portfolio-Safe / No Real Healthcare Data
# ============================================================

RANDOM_SEED = 42
random.seed(RANDOM_SEED)

OUTPUT_DIR = Path(__file__).parent

NUM_MEMBERS = 5000
NUM_PROVIDERS = 250
NUM_SERVICES = 50
NUM_CLAIMS = 50000


# ============================================================
# Reference Data
# ============================================================

STATES = [
    "CA",
    "TX",
    "NY",
    "FL",
    "IL",
    "WA",
    "AZ",
    "GA",
    "CO",
    "NC",
    "VA",
    "OH",
    "MI",
    "PA",
    "NJ",
]

REGIONS = {
    "CA": "West",
    "TX": "South",
    "NY": "Northeast",
    "FL": "South",
    "IL": "Midwest",
    "WA": "West",
    "AZ": "West",
    "GA": "South",
    "CO": "West",
    "NC": "South",
    "VA": "South",
    "OH": "Midwest",
    "MI": "Midwest",
    "PA": "Northeast",
    "NJ": "Northeast",
}

PLAN_TYPES = [
    "PPO",
    "HMO",
    "EPO",
    "POS",
]

GENDERS = [
    "Female",
    "Male",
    "Non-Binary",
    "Unknown",
]

MEMBER_STATUSES = [
    "Active",
    "Inactive",
]

PROVIDER_TYPES = [
    "Hospital",
    "Physician",
    "Clinic",
    "Laboratory",
    "Imaging Center",
    "Specialist",
]

SPECIALTIES = [
    "Primary Care",
    "Cardiology",
    "Orthopedics",
    "Emergency Medicine",
    "Oncology",
    "Radiology",
    "Dermatology",
    "General Surgery",
]

NETWORK_STATUSES = [
    "In-Network",
    "Out-of-Network",
]

SERVICE_CATEGORIES = [
    "Primary Care",
    "Specialist",
    "Emergency",
    "Inpatient",
    "Outpatient",
    "Laboratory",
    "Imaging",
    "Pharmacy",
    "Surgery",
]

SERVICE_TYPES = [
    "Professional",
    "Outpatient",
    "Inpatient",
]

CLAIM_STATUSES = [
    "Paid",
    "Denied",
    "Pending",
    "Adjusted",
]

PLACE_OF_SERVICE = [
    "Office",
    "Hospital",
    "Emergency Department",
    "Outpatient Facility",
    "Laboratory",
    "Imaging Center",
]


# ============================================================
# Utility Functions
# ============================================================

def random_date(start_date, end_date):
    """Return a random date between two dates."""
    days = (end_date - start_date).days
    return start_date + timedelta(days=random.randint(0, days))


def write_csv(filename, fieldnames, rows):
    """Write rows to a CSV file."""
    file_path = OUTPUT_DIR / filename

    with open(file_path, "w", newline="", encoding="utf-8") as file:
        writer = csv.DictWriter(file, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)

    print(f"Created {filename}: {len(rows):,} rows")


# ============================================================
# Generate Members
# ============================================================

def generate_members():
    rows = []

    start_date = date(2024, 1, 1)
    end_date = date(2026, 1, 1)

    for i in range(1, NUM_MEMBERS + 1):
        member_id = f"MEM-{i:06d}"

        rows.append(
            {
                "member_id": member_id,
                "member_age": random.randint(18, 85),
                "gender": random.choice(GENDERS),
                "state": random.choice(STATES),
                "plan_type": random.choice(PLAN_TYPES),
                "enrollment_date": random_date(
                    start_date,
                    end_date
                ).isoformat(),
                "member_status": random.choices(
                    MEMBER_STATUSES,
                    weights=[90, 10],
                    k=1
                )[0],
            }
        )

    fields = [
        "member_id",
        "member_age",
        "gender",
        "state",
        "plan_type",
        "enrollment_date",
        "member_status",
    ]

    write_csv("members.csv", fields, rows)

    return rows


# ============================================================
# Generate Providers
# ============================================================

def generate_providers():
    rows = []

    for i in range(1, NUM_PROVIDERS + 1):
        provider_id = f"PRV-{i:06d}"

        rows.append(
            {
                "provider_id": provider_id,
                "provider_name": f"Synthetic Provider Group {i:03d}",
                "provider_type": random.choice(PROVIDER_TYPES),
                "specialty": random.choice(SPECIALTIES),
                "state": random.choice(STATES),
                "network_status": random.choices(
                    NETWORK_STATUSES,
                    weights=[85, 15],
                    k=1
                )[0],
                "quality_score": round(
                    random.uniform(65, 98),
                    1
                ),
            }
        )

    fields = [
        "provider_id",
        "provider_name",
        "provider_type",
        "specialty",
        "state",
        "network_status",
        "quality_score",
    ]

    write_csv("providers.csv", fields, rows)

    return rows


# ============================================================
# Generate Services
# ============================================================

def generate_services():
    rows = []

    service_names = [
        "Primary Care Visit",
        "Specialist Consultation",
        "Emergency Department Visit",
        "MRI Scan",
        "CT Scan",
        "X-Ray",
        "Laboratory Test",
        "Blood Test",
        "Surgical Procedure",
        "Outpatient Surgery",
        "Inpatient Admission",
        "Physical Therapy",
        "Dermatology Visit",
        "Cardiology Consultation",
        "Orthopedic Consultation",
        "Radiology Service",
        "Preventive Care Visit",
        "Follow-up Visit",
        "Diagnostic Imaging",
        "General Consultation",
    ]

    for i in range(1, NUM_SERVICES + 1):
        service_id = f"SRV-{i:06d}"

        rows.append(
            {
                "service_id": service_id,
                "service_category": random.choice(
                    SERVICE_CATEGORIES
                ),
                "service_name": random.choice(
                    service_names
                ),
                "service_type": random.choice(
                    SERVICE_TYPES
                ),
                "specialty": random.choice(
                    SPECIALTIES
                ),
            }
        )

    fields = [
        "service_id",
        "service_category",
        "service_name",
        "service_type",
        "specialty",
    ]

    write_csv("services.csv", fields, rows)

    return rows


# ============================================================
# Generate Claims
# ============================================================

def generate_claims(members, providers, services):
    rows = []

    member_ids = [row["member_id"] for row in members]
    provider_ids = [row["provider_id"] for row in providers]
    service_ids = [row["service_id"] for row in services]

    service_start = date(2025, 1, 1)
    service_end = date(2026, 6, 30)

    for i in range(1, NUM_CLAIMS + 1):
        claim_id = f"CLM-{i:06d}"

        service_date = random_date(
            service_start,
            service_end
        )

        claim_received_date = service_date + timedelta(
            days=random.randint(1, 14)
        )

        claim_status = random.choices(
            CLAIM_STATUSES,
            weights=[78, 8, 9, 5],
            k=1
        )[0]

        claim_amount = round(
            random.uniform(100, 15000),
            2
        )

        allowed_amount = round(
            claim_amount * random.uniform(0.55, 0.90),
            2
        )

        member_responsibility = round(
            allowed_amount * random.uniform(0.05, 0.30),
            2
        )

        paid_amount = round(
            allowed_amount - member_responsibility,
            2
        )

        if claim_status == "Denied":
            paid_amount = 0.00
            member_responsibility = 0.00
            spend_amount = 0.00

        elif claim_status == "Pending":
            paid_amount = 0.00
            spend_amount = 0.00

        else:
            spend_amount = paid_amount

        rows.append(
            {
                "claim_id": claim_id,
                "member_id": random.choice(member_ids),
                "provider_id": random.choice(provider_ids),
                "service_id": random.choice(service_ids),
                "service_date": service_date.isoformat(),
                "claim_received_date": claim_received_date.isoformat(),
                "claim_status": claim_status,
                "claim_amount": claim_amount,
                "allowed_amount": allowed_amount,
                "member_responsibility": member_responsibility,
                "paid_amount": paid_amount,
                "spend_amount": spend_amount,
                "place_of_service": random.choice(
                    PLACE_OF_SERVICE
                ),
            }
        )

    fields = [
        "claim_id",
        "member_id",
        "provider_id",
        "service_id",
        "service_date",
        "claim_received_date",
        "claim_status",
        "claim_amount",
        "allowed_amount",
        "member_responsibility",
        "paid_amount",
        "spend_amount",
        "place_of_service",
    ]

    write_csv("claims.csv", fields, rows)

    return rows


# ============================================================
# Generate Claim Lines
# ============================================================

def generate_claim_lines(claims, services):
    rows = []

    service_ids = [row["service_id"] for row in services]

    claim_line_counter = 1

    for claim in claims:
        number_of_lines = random.randint(1, 3)

        for _ in range(number_of_lines):
            claim_amount = round(
                random.uniform(50, 5000),
                2
            )

            allowed_amount = round(
                claim_amount * random.uniform(0.55, 0.90),
                2
            )

            paid_amount = round(
                allowed_amount * random.uniform(0.60, 0.95),
                2
            )

            rows.append(
                {
                    "claim_line_id": f"CL-{claim_line_counter:06d}",
                    "claim_id": claim["claim_id"],
                    "service_id": random.choice(service_ids),
                    "procedure_code": (
                        f"SYN-{random.randint(10000, 99999)}"
                    ),
                    "units": random.randint(1, 5),
                    "line_claim_amount": claim_amount,
                    "line_allowed_amount": allowed_amount,
                    "line_paid_amount": paid_amount,
                }
            )

            claim_line_counter += 1

    fields = [
        "claim_line_id",
        "claim_id",
        "service_id",
        "procedure_code",
        "units",
        "line_claim_amount",
        "line_allowed_amount",
        "line_paid_amount",
    ]

    write_csv("claim_lines.csv", fields, rows)

    return rows


# ============================================================
# Main Execution
# ============================================================

def main():
    print("Starting synthetic healthcare insurance data generation...")
    print(f"Random seed: {RANDOM_SEED}")
    print()

    members = generate_members()
    providers = generate_providers()
    services = generate_services()
    claims = generate_claims(
        members,
        providers,
        services
    )
    generate_claim_lines(
        claims,
        services
    )

    print()
    print("Synthetic dataset generation completed.")
    print("All generated data is portfolio-safe and synthetic.")


if __name__ == "__main__":
    main()
