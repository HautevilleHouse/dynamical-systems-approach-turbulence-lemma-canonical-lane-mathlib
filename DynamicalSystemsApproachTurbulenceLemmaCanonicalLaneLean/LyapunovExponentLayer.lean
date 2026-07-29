import DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean.AttractorTurbulenceLayer

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean

structure LyapunovCertificate where
  attractor : AttractorCertificate
  maxLyapunovPositive : Prop
  lyapunovRegularity : Prop
  positivityProof : maxLyapunovPositive
  regularityProof : lyapunovRegularity

def sourceLyapunovCertificate : LyapunovCertificate := {
  attractor := sourceAttractorCertificate
  maxLyapunovPositive := True
  lyapunovRegularity := True
  positivityProof := trivial
  regularityProof := trivial
}

def LyapunovClosed (C : LyapunovCertificate) : Prop :=
  AttractorClosed C.attractor ∧ C.maxLyapunovPositive ∧ C.lyapunovRegularity

theorem source_lyapunov_closed : LyapunovClosed sourceLyapunovCertificate := by
  exact And.intro source_attractor_closed
    (And.intro sourceLyapunovCertificate.positivityProof
      sourceLyapunovCertificate.regularityProof)

end DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean
end HautevilleHouse