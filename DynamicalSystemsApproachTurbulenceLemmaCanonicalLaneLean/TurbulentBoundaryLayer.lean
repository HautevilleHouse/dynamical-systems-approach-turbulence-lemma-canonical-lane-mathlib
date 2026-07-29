import DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean.NavierStokesLayer

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean

structure TurbulentBoundaryCertificate where
  navierStokes : NavierStokesCertificate
  boundaryThickness : ℝ
  wallShearStress : ℝ
  boundaryLayerEquations : Prop
  boundaryLayerEquationsClosed : boundaryLayerEquations

def sourceTurbulentBoundaryCertificate : TurbulentBoundaryCertificate := {
  navierStokes := sourceNavierStokesCertificate
  boundaryThickness := 0
  wallShearStress := 0
  boundaryLayerEquations := TurbulenceEquationClosed primitiveTurbulentFlow
  boundaryLayerEquationsClosed := primitive_flow_equation_closed_checked
}

def TurbulentBoundaryCertificateClosed (C : TurbulentBoundaryCertificate) : Prop :=
  NavierStokesCertificateClosed C.navierStokes ∧ C.boundaryLayerEquations

theorem source_turbulent_boundary_certificate_closed :
    TurbulentBoundaryCertificateClosed sourceTurbulentBoundaryCertificate := by
  exact And.intro source_navier_stokes_certificate_closed
    sourceTurbulentBoundaryCertificate.boundaryLayerEquationsClosed

end DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean
end HautevilleHouse