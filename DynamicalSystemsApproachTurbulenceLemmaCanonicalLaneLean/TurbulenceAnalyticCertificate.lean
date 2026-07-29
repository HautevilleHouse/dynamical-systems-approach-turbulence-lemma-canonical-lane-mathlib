import DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean.IntermittencyLayer

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean

structure TurbulenceAnalyticCertificate where
  substrate : MathlibPDESubstrate
  attractorLayerClosed : Prop
  lyapunovLayerClosed : Prop
  energyCascadeLayerClosed : Prop
  intermittencyLayerClosed : Prop
  attractorLayerProof : attractorLayerClosed
  lyapunovLayerProof : lyapunovLayerClosed
  energyCascadeLayerProof : energyCascadeLayerClosed
  intermittencyLayerProof : intermittencyLayerClosed

def sourceTurbulenceAnalyticCertificate : TurbulenceAnalyticCertificate := {
  substrate := mathlibPDESubstrate
  attractorLayerClosed := AttractorClosed sourceAttractorCertificate
  lyapunovLayerClosed := LyapunovClosed sourceLyapunovCertificate
  energyCascadeLayerClosed := EnergyCascadeClosed sourceEnergyCascadeCertificate
  intermittencyLayerClosed := IntermittencyClosed sourceIntermittencyCertificate
  attractorLayerProof := source_attractor_closed
  lyapunovLayerProof := source_lyapunov_closed
  energyCascadeLayerProof := source_energy_cascade_closed
  intermittencyLayerProof := source_intermittency_closed
}

def TurbulenceAnalyticCertificateClosed (C : TurbulenceAnalyticCertificate) : Prop :=
  C.attractorLayerClosed ∧ C.lyapunovLayerClosed ∧ C.energyCascadeLayerClosed ∧ C.intermittencyLayerClosed

theorem source_turbulence_analytic_certificate_closed : TurbulenceAnalyticCertificateClosed sourceTurbulenceAnalyticCertificate := by
  exact And.intro sourceTurbulenceAnalyticCertificate.attractorLayerProof
    (And.intro sourceTurbulenceAnalyticCertificate.lyapunovLayerProof
      (And.intro sourceTurbulenceAnalyticCertificate.energyCascadeLayerProof
        sourceTurbulenceAnalyticCertificate.intermittencyLayerProof))

end DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean
end HautevilleHouse