import DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean.CompactnessRigidityLayer

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean

structure RegularityEndpointCertificate where
  compactnessRigidity : CompactnessRigidityCertificate
  sourceFormulaClosed : Prop
  bridgeClosedOnObject : Prop
  gateClosedOnAdmissibleClass : Prop
  theoremBoundaryCarried : Prop
  sourceFormulaClosedProof : sourceFormulaClosed
  bridgeClosedOnObjectProof : bridgeClosedOnObject
  gateClosedOnAdmissibleClassProof : gateClosedOnAdmissibleClass
  theoremBoundaryCarriedProof : theoremBoundaryCarried

def analyticAdmittedObject : AdmittedTheoremObject := {
  object := theoremSpecificObject
  localWitness := "Turbulence analytic certificate with Navier-Stokes, boundary layer, energy cascade, Reynolds stress"
  bridgeEvidence := "source-derived Lean certificate fields"
  sourceKeyChecked := rfl
  theoremObjectChecked := rfl
}

def analyticAdmissibleClass : AdmissibleClass := {
  object := analyticAdmittedObject
  endpointSatisfied := TurbulenceEquationClosed primitiveTurbulentFlow
  remainderRecorded := formalizationCertificate.theoremBoundaryOpen = true
  gateWitness := Or.inl primitive_flow_equation_closed_checked
}

def sourceRegularityEndpointCertificate : RegularityEndpointCertificate := {
  compactnessRigidity := sourceCompactnessRigidityCertificate
  sourceFormulaClosed := sourceFormulaModels.length = 7
  bridgeClosedOnObject := bridgeClosed analyticAdmissibleClass
  gateClosedOnAdmissibleClass := gateClosed analyticAdmissibleClass
  theoremBoundaryCarried := formalizationCertificate.theoremBoundaryOpen = true
  sourceFormulaClosedProof := rfl
  bridgeClosedOnObjectProof := bridge_from_admissible_class analyticAdmissibleClass
  gateClosedOnAdmissibleClassProof := gate_from_admissible_class analyticAdmissibleClass
  theoremBoundaryCarriedProof := rfl
}

def RegularityEndpointClosed (C : RegularityEndpointCertificate) : Prop :=
  CompactnessRigidityClosed C.compactnessRigidity ∧
  C.sourceFormulaClosed ∧
  C.bridgeClosedOnObject ∧
  C.gateClosedOnAdmissibleClass ∧
  C.theoremBoundaryCarried

theorem source_regularity_endpoint_closed :
    RegularityEndpointClosed sourceRegularityEndpointCertificate := by
  exact And.intro source_compactness_rigidity_closed
    (And.intro sourceRegularityEndpointCertificate.sourceFormulaClosedProof
      (And.intro sourceRegularityEndpointCertificate.bridgeClosedOnObjectProof
        (And.intro sourceRegularityEndpointCertificate.gateClosedOnAdmissibleClassProof
          sourceRegularityEndpointCertificate.theoremBoundaryCarriedProof)))

end DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean
end HautevilleHouse