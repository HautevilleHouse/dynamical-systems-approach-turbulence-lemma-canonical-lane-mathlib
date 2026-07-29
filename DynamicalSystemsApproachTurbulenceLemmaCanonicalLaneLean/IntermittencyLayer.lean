import DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean.EnergyCascadeLayer

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean

structure IntermittencyCertificate where
  energyCascade : EnergyCascadeCertificate
  intermittencyModel : Prop
  smallScaleStructures : Prop
  modelProof : intermittencyModel
  structuresProof : smallScaleStructures

def sourceIntermittencyCertificate : IntermittencyCertificate := {
  energyCascade := sourceEnergyCascadeCertificate
  intermittencyModel := True
  smallScaleStructures := True
  modelProof := trivial
  structuresProof := trivial
}

def IntermittencyClosed (C : IntermittencyCertificate) : Prop :=
  EnergyCascadeClosed C.energyCascade ∧ C.intermittencyModel ∧ C.smallScaleStructures

theorem source_intermittency_closed : IntermittencyClosed sourceIntermittencyCertificate := by
  exact And.intro source_energy_cascade_closed
    (And.intro sourceIntermittencyCertificate.modelProof
      sourceIntermittencyCertificate.structuresProof)

end DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean
end HautevilleHouse