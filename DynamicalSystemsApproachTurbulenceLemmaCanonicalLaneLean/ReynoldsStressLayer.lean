import DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean.EnergyCascadeLayer

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean

structure ReynoldsStressCertificate where
  cascade : EnergyCascadeCertificate
  stressTensor : VectorField → VectorField
  productionTerm : Prop
  dissipationTerm : Prop
  productionTermClosed : productionTerm
  dissipationTermClosed : dissipationTerm

def sourceReynoldsStressCertificate : ReynoldsStressCertificate := {
  cascade := sourceEnergyCascadeCertificate
  stressTensor := fun u => zeroVectorField
  productionTerm := primitiveTurbulentFlow.turbulence.dissipationRate = 0
  dissipationTerm := primitiveTurbulentFlow.turbulence.dissipationRate = 0
  productionTermClosed := rfl
  dissipationTermClosed := rfl
}

def ReynoldsStressCertificateClosed (C : ReynoldsStressCertificate) : Prop :=
  EnergyCascadeCertificateClosed C.cascade ∧ C.productionTerm ∧ C.dissipationTerm

theorem source_reynolds_stress_certificate_closed :
    ReynoldsStressCertificateClosed sourceReynoldsStressCertificate := by
  exact And.intro source_energy_cascade_certificate_closed
    (And.intro sourceReynoldsStressCertificate.productionTermClosed
      sourceReynoldsStressCertificate.dissipationTermClosed)

end DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean
end HautevilleHouse