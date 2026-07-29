import DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean.TurbulentBoundaryLayer

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean

structure EnergyCascadeCertificate where
  boundary : TurbulentBoundaryCertificate
  inertialRange : Prop
  dissipationRange : Prop
  energyFlux : ℝ
  inertialRangeClosed : inertialRange
  dissipationRangeClosed : dissipationRange

def sourceEnergyCascadeCertificate : EnergyCascadeCertificate := {
  boundary := sourceTurbulentBoundaryCertificate
  inertialRange := primitiveTurbulentFlow.turbulence.dissipationRate = 0
  dissipationRange := primitiveTurbulentFlow.turbulence.dissipationRate ≥ 0
  energyFlux := 0
  inertialRangeClosed := rfl
  dissipationRangeClosed := rfl
}

def EnergyCascadeCertificateClosed (C : EnergyCascadeCertificate) : Prop :=
  TurbulentBoundaryCertificateClosed C.boundary ∧ C.inertialRange ∧ C.dissipationRange

theorem source_energy_cascade_certificate_closed :
    EnergyCascadeCertificateClosed sourceEnergyCascadeCertificate := by
  exact And.intro source_turbulent_boundary_certificate_closed
    (And.intro sourceEnergyCascadeCertificate.inertialRangeClosed
      sourceEnergyCascadeCertificate.dissipationRangeClosed)

end DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean
end HautevilleHouse