# PLAN-[feature-short-name]

*Instructions: Replace `[feature-short-name]` with the kebab-cased short name of the approved SPEC (e.g. `PLAN-user-auth`, `PLAN-payment-gateway-cash`). Align closely with the scope approved in the SPEC.*

## 1. Scope
*Summarize what this implementation plan covers, linking back to the approved spec.*
- **Reference Spec**: [SPEC-[feature-short-name]](file:///absolute/path/to/specs/SPEC-[feature-short-name].md)

## 2. Files Inspected
*List the codebase files you inspected or analyzed to design this plan. This ensures the plan is grounded in code reality.*
- `src/path/to/existing_file.js` - Inspecting current validation logic
- `src/path/to/routes.js` - Checking middleware registrations

## 3. Files Expected To Change
*List the target files to create or modify. This forms the boundary for files Claude is allowed to touch.*
- [ ] `src/path/to/new_file.js` (Create) - To hold new helper functions
- [ ] `src/path/to/existing_file.js` (Modify) - Injecting new middleware rules

## 4. Current Architecture Understanding
*Explain the existing programming pattern, design system, database connections, or state management relevant to the target files.*

## 5. Design Approach
*Explain your implementation strategies, algorithms, naming conventions, or patterns you intend to introduce.*
- **Design Pattern**: e.g., Strategy pattern for payment engines.
- **Error Handling**: How errors are caught, logged, and returned to client.

## 6. Step-by-step Implementation
*Break down the implementation into clear, atomic, numbered steps. Each step should be testable.*
1. **Step 1**: Create the data migration script or database models.
2. **Step 2**: Implement core logic in the service layer.
3. **Step 3**: Bind service methods to controllers/endpoints.
4. **Step 4**: Update UI layout and routing rules.
5. **Step 5**: Run testing sequences.

## 7. Data Model Changes
*Define database table schemas, modifications, migrations, or DTO structures.*
```sql
-- Example Schema adjustments:
ALTER TABLE payments ADD COLUMN is_cash BOOLEAN DEFAULT FALSE;
```

## 8. API Changes
*Document the API routes, headers, query parameters, request/response formats that will be added or modified.*
- **Endpoint**: `POST /api/v1/checkout`
  - **Body**:
    ```json
    {
      "payment_method": "cash"
    }
    ```

## 9. Config Changes
*Detail new packages to install, environment variables in `.env`, or registry settings.*
- `NEW_VAR_NAME`: Description of value

## 10. Test Plan
*Explain how the changes will be validated. Include both automated unit tests and manual steps.*
### Automated Tests
- Command: `npm test` or `dotnet test`
- New Test Cases: Verification of success/failure paths in `paymentService.test.js`.

### Manual Testing Steps
1. Navigate to Checkout page.
2. Select Cash option.
3. Complete Checkout.
4. Observe order database status is `PendingCashPayment`.

## 11. Risks
*Identify technical risks (e.g. latency, concurrent updates, API failures) and specify mitigations.*
- **Risk**: Performance degradation due to database lookup in loop.
  - *Mitigation*: Fetch records in bulk using pre-fetch arrays.

## 12. Rollback Plan
*Provide clear instructions on how to quickly revert changes if a critical bug occurs post-implementation.*
- **Git Revert**: `git checkout -- .` or `git revert <commit>`
- **Database Rollback**: Execute rollback migration scripts.

## 13. Code Approval
*Instruction to the user to approve this plan before coding begins.*

---

*Once completed, prompt the user:*
> "Do you approve coding? Reply **APPROVED CODE** to start implementation."
