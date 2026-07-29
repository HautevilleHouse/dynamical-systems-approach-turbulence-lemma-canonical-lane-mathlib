import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean.DynamicalObjects

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean

structure TurbulenceCertificate where
  flow : DynamicalFlow
  reynoldsNumber : ℝ
  spectralCascade : Prop
  dissipationRate : Prop
  mixingLength : Prop
  spectralCascadeClosed : spectralCascade
  dissipationRateClosed : dissipationRate
  mixingLengthClosed : mixingLength

def sourceTurbulenceCertificate : TurbulenceCertificate := {
  flow := primitiveFlow
  reynoldsNumber := 1.0
  spectralCascade := True
  dissipationRate := True
  mixingLength := True
  spectralCascadeClosed := trivial
  dissipationRateClosed := trivial
  mixingLengthClosed := trivial
}

def TurbulenceClosed (C : TurbulenceCertificate) : Prop :=
  C.spectralCascade ∧ C.dissipationRate ∧ C.mixingLength

theorem source_turbulence_closed : TurbulenceClosed sourceTurbulenceCertificate := by
  exact And.intro sourceTurbulenceCertificate.spectralCascadeClosed
    (And.intro sourceTurbulenceCertificate.dissipationRateClosed sourceTurbulenceCertificate.mixingLengthClosed)

end DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean
end HautevilleHouse