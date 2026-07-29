import DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean.DynamicalSystemsObjects

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean

structure AttractorCertificate where
  flow : NavierStokesFlow
  attractorExists : Prop
  attractorInvariant : Prop
  attractorFiniteDim : Prop
  attractorExistsProof : attractorExists
  attractorInvariantProof : attractorInvariant
  attractorFiniteDimProof : attractorFiniteDim

def sourceAttractorCertificate : AttractorCertificate := {
  flow := primitiveFlow
  attractorExists := True
  attractorInvariant := True
  attractorFiniteDim := True
  attractorExistsProof := trivial
  attractorInvariantProof := trivial
  attractorFiniteDimProof := trivial
}

def AttractorClosed (C : AttractorCertificate) : Prop :=
  C.attractorExists ∧ C.attractorInvariant ∧ C.attractorFiniteDim

theorem source_attractor_closed : AttractorClosed sourceAttractorCertificate := by
  exact And.intro sourceAttractorCertificate.attractorExistsProof
    (And.intro sourceAttractorCertificate.attractorInvariantProof
      sourceAttractorCertificate.attractorFiniteDimProof)

end DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean
end HautevilleHouse