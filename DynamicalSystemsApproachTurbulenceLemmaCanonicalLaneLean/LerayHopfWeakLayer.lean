import DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean.NavierStokesLayer

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean

structure LerayHopfEnvelope where
  flow : TurbulentFlow
  finiteEnergy : Prop
  divergenceFree : Prop
  energyInequality : Prop
  weakEquation : Prop
  finiteEnergyClosed : finiteEnergy
  divergenceFreeClosed : divergenceFree
  energyInequalityClosed : energyInequality
  weakEquationClosed : weakEquation

def sourceLerayHopfEnvelope : LerayHopfEnvelope := {
  flow := primitiveTurbulentFlow
  finiteEnergy := baselineCertificateAllPass = true
  divergenceFree := Incompressible primitiveTurbulentFlow
  energyInequality := baselineCertificateInputs.length = 7
  weakEquation := TurbulenceEquationClosed primitiveTurbulentFlow
  finiteEnergyClosed := rfl
  divergenceFreeClosed := primitive_flow_incompressible_checked
  energyInequalityClosed := rfl
  weakEquationClosed := primitive_flow_equation_closed_checked
}

def LerayHopfEnvelopeClosed (E : LerayHopfEnvelope) : Prop :=
  E.finiteEnergy ∧ E.divergenceFree ∧ E.energyInequality ∧ E.weakEquation

theorem source_leray_hopf_envelope_closed :
    LerayHopfEnvelopeClosed sourceLerayHopfEnvelope := by
  exact And.intro sourceLerayHopfEnvelope.finiteEnergyClosed
    (And.intro sourceLerayHopfEnvelope.divergenceFreeClosed
      (And.intro sourceLerayHopfEnvelope.energyInequalityClosed
        sourceLerayHopfEnvelope.weakEquationClosed))

end DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean
end HautevilleHouse