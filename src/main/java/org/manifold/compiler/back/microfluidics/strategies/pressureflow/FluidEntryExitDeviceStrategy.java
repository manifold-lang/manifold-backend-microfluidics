package org.manifold.compiler.back.microfluidics.strategies.pressureflow;

import java.util.LinkedList;
import java.util.List;

import org.manifold.compiler.ConnectionValue;
import org.manifold.compiler.NodeValue;
import org.manifold.compiler.PortValue;
import org.manifold.compiler.RealValue;
import org.manifold.compiler.UndeclaredAttributeException;
import org.manifold.compiler.UndeclaredIdentifierException;
import org.manifold.compiler.back.microfluidics.CodeGenerationError;
import org.manifold.compiler.back.microfluidics.PrimitiveTypeTable;
import org.manifold.compiler.back.microfluidics.ProcessParameters;
import org.manifold.compiler.back.microfluidics.SchematicUtil;
import org.manifold.compiler.back.microfluidics.TranslationStrategy;
import org.manifold.compiler.back.microfluidics.smt2.Decimal;
import org.manifold.compiler.back.microfluidics.smt2.Numeral;
import org.manifold.compiler.back.microfluidics.smt2.QFNRA;
import org.manifold.compiler.back.microfluidics.smt2.SExpression;
import org.manifold.compiler.back.microfluidics.smt2.Symbol;
import org.manifold.compiler.back.microfluidics.smt2.SymbolNameGenerator;
import org.manifold.compiler.middle.Schematic;

public class FluidEntryExitDeviceStrategy extends TranslationStrategy {
  
  @Override
  protected List<SExpression> translationStep(Schematic schematic,
      ProcessParameters processParams, PrimitiveTypeTable typeTable) {
    List<SExpression> exprs = new LinkedList<>();
    for (NodeValue node : schematic.getNodes().values()) {
      try {
        if (node.getType().isSubtypeOf(typeTable.getFluidEntryNodeType())) {
          exprs.addAll(translateFluidEntryNode(schematic, node));
        } else if (node.getType().isSubtypeOf(
            typeTable.getFluidExitNodeType())) {
          exprs.addAll(translateFluidExitNode(schematic, node));
        }
      } catch (UndeclaredIdentifierException e) {
        throw new CodeGenerationError("undeclared identifier '"
            + e.getIdentifier() + "' when inspecting fluid entry/exit node '"
            + schematic.getNodeName(node) + "'; "
            + "possible schematic version mismatch");
      } catch (UndeclaredAttributeException e) {
        throw new CodeGenerationError("undeclared attribute "
            + " when inspecting fluid entry/exit node '"
            + schematic.getNodeName(node) + "'; "
            + "possible schematic version mismatch");
      }
    }
    return exprs;
  }

  private List<SExpression> translateFluidEntryNode(
      Schematic schematic, NodeValue node) 
      throws UndeclaredIdentifierException, UndeclaredAttributeException {
    List<SExpression> exprs = new LinkedList<>();
    exprs.add(QFNRA.declareRealVariable(
        SymbolNameGenerator.getsym_NodeX(schematic, node)));
    exprs.add(QFNRA.declareRealVariable(
        SymbolNameGenerator.getsym_NodeY(schematic, node)));
    exprs.add(QFNRA.declareRealVariable(
        SymbolNameGenerator.getSym_PortPressure(schematic, 
            node.getPort("output"))));
    // constraint: port pressure >= 0
    exprs.add(QFNRA.assertLessThanEqual(new Numeral(0), 
        SymbolNameGenerator.getSym_PortPressure(schematic,
            node.getPort("output"))));
    
    // the viscosity in the channel connected to output
    // is the viscosity given at the entry
    ConnectionValue ch = SchematicUtil.getConnection(
        schematic, node.getPort("output"));
    Symbol mu = SymbolNameGenerator.getsym_ChannelViscosity(schematic, ch);
    RealValue viscosity = (RealValue) node.getAttribute("viscosity");
    exprs.add(QFNRA.assertEqual(mu, new Decimal(viscosity.toDouble())));
    return exprs;
  }
  
  private List<SExpression> translateFluidExitNode(
      Schematic schematic, NodeValue node) 
      throws UndeclaredIdentifierException {
    List<SExpression> exprs = new LinkedList<>();
    exprs.add(QFNRA.declareRealVariable(
        SymbolNameGenerator.getsym_NodeX(schematic, node)));
    exprs.add(QFNRA.declareRealVariable(
        SymbolNameGenerator.getsym_NodeY(schematic, node)));
    exprs.add(QFNRA.declareRealVariable(
        SymbolNameGenerator.getSym_PortPressure(schematic, 
            node.getPort("input"))));
    
    // constraint: port pressure >= 0
    exprs.add(QFNRA.assertLessThanEqual(new Numeral(0), 
        SymbolNameGenerator.getSym_PortPressure(schematic,
            node.getPort("input"))));
    
    return exprs;
  }
  
}
